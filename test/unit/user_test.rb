require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should insert some user with name" do
    user = User.new :name => "Test Use"
    assert user.save
  end
end
