require "test_helper"

class SoloTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Solo::VERSION
  end

  def test_it_blocks_other_invocations
    fork {
      Solo.call(38000) { sleep 1; }
    }  
    begin
      sleep 0.01
      Solo.call(38000)
      assert false # should never get here
    rescue
    end
    Process.wait
  end
end
