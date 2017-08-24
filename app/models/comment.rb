class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes

  validates :video_url, presence: true

  after_validation :change_to_embed

  def change_to_embed
    if video_url.include?("embed") == false
      self.video_url["https://youtu.be/"] = "" if self.video_url.include? "https://youtu.be/"
      self.video_url["https://www.youtube.com/watch?v="] = "" if self.video_url.include? "https://www.youtube.com/watch?v="
      self.video_url = "https://www.youtube.com/embed/#{self.video_url}"
    end
  end

  def votes_of
    self.votes.sum(:value)
  end
end
