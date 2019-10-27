require "test_helper"

class SoloCliTest < Minitest::Test

  def test_it_runs_shell_commands
    test_time = 1
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    Solo::CLI.call(["--port", "38000", "sleep", "#{test_time}"])
    diff_time = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
    assert diff_time > test_time
  end

  def test_it_parses_port_option
    assert_raises(ArgumentError) { Solo::CLI.parse_opts(["sleep", "1"]) }
    assert_raises(OptionParser::InvalidArgument) { Solo::CLI.parse_opts(["--port", "abc", "sleep", "1"])}
    assert_raises(OptionParser::InvalidOption) { Solo::CLI.parse_opts(["--port", "-1", "sleep", "1"])}
    assert_raises(ArgumentError) { Solo::CLI.parse_opts(["--port", "99999999999", "sleep", "1"])}
  end
end
