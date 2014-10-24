require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  should validate_presence_of(:user)
  should validate_presence_of(:title)
  should validate_presence_of(:body)
end
