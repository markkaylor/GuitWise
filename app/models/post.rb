class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, presence: true
  validates :video_url, presence: true

  def votes_of
    self.votes.sum(:value)
  end
end
