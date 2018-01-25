class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users_comment, through: :comments, class_name: :User

  validates :title, :body, presence: true
  scope :infor_post, ->{select :id, :user_id, :title, :body, :picture, :created_at }
end
