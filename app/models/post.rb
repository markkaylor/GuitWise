class Post < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :video_url, presence: true
end
