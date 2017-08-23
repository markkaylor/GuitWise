class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes

  validates :video_url, presence: true

  def votes_of
    self.votes.sum(:value)
  end
end
