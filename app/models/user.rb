class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :posts, through: :comments

  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PictureUploader
  validates :name, length: {maximum: Settings.size_name}, presence: true
  VALID_PHONE_REGEX = /[0-9\-\+\(\)]/
  validates :phone, length: {in: Settings.min_phone..Settings.max_phone}, presence: true,
    format: {with: VALID_PHONE_REGEX}
  validates :address, length: {maximum: Settings.size_address}, presence: true

  scope :info_user, ->{select :id, :name, :email, :phone, :address, :role}
end
