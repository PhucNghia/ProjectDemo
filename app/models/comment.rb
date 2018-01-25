class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, :post_id, :comment, presence: true
end
