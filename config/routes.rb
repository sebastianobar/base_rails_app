Rails.application.routes.draw do
  system_admin_constraint = lambda do |request|
    return true if Rails.env.development?
    current_user = request.env["warden"].user
    current_user.present? && current_user.has_role?(:system_admin)
  end

  constraints system_admin_constraint do
    mount MissionControl::Jobs::Engine, at: "/jobs"
    mount RailsPerformance::Engine, at: "/rails/performance"
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    get "users/confirm_email_info", to: "users/registrations#confirm_email_info"
  end

  namespace :users do
    resource :profile, only: %i[new edit create update] do
      delete :destroy_avatar, on: :member
    end
  end
  resolve("Users::Profile") { [ :users_profile ] }

  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
