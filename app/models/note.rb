class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :responder, presence: true
  validates :body, presence: true
end
