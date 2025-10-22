class Users::Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar do |attachable|
    attachable.variant :normalized, resize_to_limit: [ 400, 400 ], preprocessed: true
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ], preprocessed: true
  end

  validates :first_name, :last_name, :birthdate, presence: true
  validates :lang, inclusion: { in: I18n.available_locales.map(&:to_s) }

  validate :avatar_image

  after_commit { user&.touch unless user&.destroyed? }

  def avatar_image
    valid_formats = %w[image/jpeg image/png image/jpg]

    if avatar.attached? && !avatar.content_type.in?(valid_formats)
      avatar.purge
      errors.add(:image, "Must be an image")
    end
  end
end
