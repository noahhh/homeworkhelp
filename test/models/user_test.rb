require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_secure_password
  should have_many(:problems)
  should have_many(:notes)
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should_not allow_value("THIS EMAIL RIGHT HERE").for(:email)
  should_not allow_value("    THISEMAIL@EITHER.COM     ").for(:email)
end
