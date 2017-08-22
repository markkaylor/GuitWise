class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes

  validates :video_url, presence: true
end
