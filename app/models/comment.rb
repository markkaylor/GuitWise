class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes

  validates :video_url, presence: true

  after_validation :change_to_embed

  def change_to_embed
    if video_url.include?("embed") == false
      self.video_url = self.video_url.split('/').last if self.video_url.include? "https://youtu.be/"
      self.video_url = /v=([A-Za-z0-9]*)&?/.match(self.video_url)[1] if self.video_url.include? "https://www.youtube.com/watch?v="
      self.video_url = "https://www.youtube.com/embed/#{self.video_url}?rel=0"
    end

    if video_url.include?("vimeo") && (video_url.include?("player") == false)
      self.video_url = "https://player.vimeo.com/video/#{self.video_url.split('/').last}"
    end

  end

  def votes_of
    self.votes.sum(:value)
  end
end
