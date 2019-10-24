require "solo/version"

require 'rationalist'
require 'socket'

module Solo
  class Error < StandardError; end
  
  def self.parse_opts args=ARGV
    opts = Rationalist.parse(
      args,
      boolean: ["quiet"],
      default: { quiet: false },
      alias: { q: "quiet", p: "port" },
      stop_early: true
    )
    unless opts[:port] and (opts[:port].is_a? Integer) and (opts[:port] > 0)
      STDERR.puts "Invalid port: #{opts[:port]}" unless opts[:quiet]
      STDERR.puts "Usage: solo --port PORT [--quiet] -- COMMAND" unless opts[:quiet]
      exit 1
    end
    if opts[:"_"].nil? or opts[:"_"].empty?
      STDERR.puts "No command given" unless opts[:quiet]
      STDERR.puts "Usage: solo --port PORT [--quiet] -- COMMAND" unless opts[:quiet]
      exit 1
    elsif opts[:"_"].length == 1
      opts[:command] = opts[:"_"].first
    else
      opts[:command] = opts[:"_"]
    end
    opts
  end

  def self.open_server port:, address: "127.0.0.1", &block
    TCPServer.open(address, port) do |serv|
      block.call
    end
  end

end

