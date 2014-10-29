class User < ActiveRecord::Base
	has_secure_password
	has_many :problems
	has_many :notes

	validates :name, presence: true
	validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

	def to_s
		name
	end
end
