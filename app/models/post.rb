class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  validates :title, :body, presence: true
end
