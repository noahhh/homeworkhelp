class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :user, presence: true
  validates :body, presence: true
end
