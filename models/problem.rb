class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :notes, dependent: :destroy
  
  validates :user, presence: true
  validates :body, presence: true
  validates :title, presence: true
end
