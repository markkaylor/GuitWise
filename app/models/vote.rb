class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates :value, presence: true
  validates :post, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :post }
end
