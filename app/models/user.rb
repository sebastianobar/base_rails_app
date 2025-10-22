class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  has_one :profile, dependent: :destroy, class_name: "Users::Profile"

  delegate :first_name, :last_name, :lang, :avatar, to: :profile, allow_nil: true

  def profile_completed?
    Users::Profile.exists?(user: self)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
