class User < ActiveRecord::Base
	has_secure_password
	has_many :problems
	has_many :notes

	validates :name, presence: true
	validates :email, presence: true
end
