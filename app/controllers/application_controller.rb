class ApplicationController < ActionController::Base
  around_action :switch_locale

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def switch_locale(&action)
    locale =  session_locale || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    return { locale: I18n.locale } if params[:locale].present?
    {}
  end

  private

  def session_locale
    selected_locale = current_user&.profile.try(:lang) || params[:locale] || extract_locale_from_accept_language_header

    ([ selected_locale.to_s ] & I18n.available_locales.map(&:to_s)).first
  end

  def extract_locale_from_accept_language_header
    request.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first
  end
end
