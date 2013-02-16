require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

   def test_new_user
    user = User.new
    assert !user.save
  end

  def test_find_out_error_message
    user = User.new
    user.email = "test@test.de"
    user.login = "foo"
    user.password = "abcd"
    user.password_confirmation = "abcd"
    assert user.save
  end
end