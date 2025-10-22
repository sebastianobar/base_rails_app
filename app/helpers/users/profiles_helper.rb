module Users::ProfilesHelper
  def profile_name_initials(user)
    return "#{user.first_name.first}#{user.last_name.first}".upcase if user_profile_completed?(user)

    "#{user.email.first}".upcase
  end

  def user_profile_completed?(user)
    Rails.cache.fetch("user_profile_completed_#{user.cache_key_with_version}", expires_in: 1.week) do
      user.profile_completed?
    end
  end

  def display_avatar?(users_profile)
    users_profile&.avatar&.attached? && users_profile&.avatar&.persisted?
  end

  def profile_language_selector
    I18n.available_locales.map { |l| [ t("language_name", locale: l), l, { selected: I18n.locale == l ? "selected" : nil } ] }
  end
end
