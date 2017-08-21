class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :video_url, presence: true
end
