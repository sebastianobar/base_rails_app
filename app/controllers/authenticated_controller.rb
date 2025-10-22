class AuthenticatedController < ApplicationController
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :check_profile_completion, if: :user_signed_in?

  def check_profile_completion
    return if helpers.user_profile_completed?(current_user)

    redirect_to new_users_profile_path, alert: t("devise.shared.complete_profile_alert")
  end
end
