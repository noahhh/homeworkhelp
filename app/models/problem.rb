class Problem < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :body, presence: true
  validates :title, presence: true
end
