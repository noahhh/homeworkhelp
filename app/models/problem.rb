class Problem < ActiveRecord::Base

  paginates_per 10

  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :user, presence: true
  validates :body, presence: true
  validates :title, presence: true
end
