class Problem < ActiveRecord::Base
  paginates_per 10

  belongs_to :user
  has_many :notes, dependent: :destroy

  # validates :user, presence: true
  validates :body, presence: true
  validates :title, presence: true

  # def solved?
  #   notes.count > 0
  # end
  #
  # def unsolved?
  #   !solved?
  # end
  #
  # def has_been_solved?
  #   problems.where(solved: true).count > 0
  # end
end
