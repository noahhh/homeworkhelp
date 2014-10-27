require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:problem)
  should validate_presence_of(:responder)
  should validate_presence_of(:body)
end
