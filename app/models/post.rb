class Post < ApplicationRecord
  # include AlgoliaSearch
  searchkick

  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, presence: true
  validates :video_url, presence: true

  after_validation :change_to_embed
  # algoliasearch do
  #   attribute :title, :content, :post_owner, :votes_of
  #   searchableAttributes ['title', 'content']
  #   customRanking ['desc(votes_of)']
  # end


  def votes_of
    self.votes.sum(:value)
  end


  def change_to_embed
    if video_url.include?("embed") == false
      self.video_url["https://youtu.be/"] = "" if self.video_url.include? "https://youtu.be/"
      self.video_url["https://www.youtube.com/watch?v="] = "" if self.video_url.include? "https://www.youtube.com/watch?v="
      self.video_url = "https://www.youtube.com/embed/#{self.video_url}"
    end
  end

  # def post_owner
  #   self.user.name
  # end

end
