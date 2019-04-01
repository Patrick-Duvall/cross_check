require "./test/test_helper"
require "./lib/stat_tracker"

class StatTrackerTest < Minitest::Test

  def test_it_exists
    stat = StatTracker.new
    assert_instance_of StatTracker, stat
  end

end
