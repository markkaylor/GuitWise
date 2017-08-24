class Post < ApplicationRecord
  # include AlgoliaSearch
  searchkick

  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, presence: true
  validates :video_url, presence: true

  # algoliasearch do
  #   attribute :title, :content, :post_owner, :votes_of
  #   searchableAttributes ['title', 'content']
  #   customRanking ['desc(votes_of)']
  # end

  def votes_of
    self.votes.sum(:value)
  end

  # def post_owner
  #   self.user.name
  # end
end
