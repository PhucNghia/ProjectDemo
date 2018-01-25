class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, :post_id, :content, presence: true
  scope :infor_comment, ->{select :id, :user_id, :post_id, :content, :created_at }
end
