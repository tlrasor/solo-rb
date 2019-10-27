require "solo/version"
require 'socket'

module Solo
  
  def self.call port, &block
    TCPServer.open("127.0.0.1", port) do |serv|
      block.call
    end
  end
end
