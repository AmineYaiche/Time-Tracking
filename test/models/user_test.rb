require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Should create new time_track raw in the database" do
    assert_difference "TimeTrack.count", 1 do
      user = users(:amine)
      user.add_track('home', 100)
    end
  end

  test "Should update existing time_track" do
    user = users(:amine)
    user.add_track('blog', 20)
    assert_equal 30, time_tracks(:amine_blog_track).time
  end

  test "Should not create new time_track if not the first visit of the page by the user" do
    user = users(:amine)
    assert_no_difference "TimeTrack.count" do
      user.add_track('blog', 20)
    end
  end
end
