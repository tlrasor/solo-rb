require 'optparse'

module Solo
  module CLI
    def self.call(argv=ARGV)
      trap("INT") { puts "Shutting down..."; exit; }
      begin
        opts = parse_opts argv
        Solo.call(opts[:port]) do
          system(*argv)
        end
      rescue
        STDERR.puts "#{$!}"
        abort
      end
    end
    def self.parse_opts argv
      opts = {}
      opts_parser = OptionParser.new do |parser|
        parser.banner = "Usage: solo --port PORT COMMAND"
        parser.on("-p", "--port [PORT]", Integer, "Set the PORT used to host the server")
      end
      opts_parser.parse!(argv, into: opts)
      unless opts[:port] && opts[:port] > 0 && opts[:port] < 65565
        raise ArgumentError.new("Invalid port: #{opts[:port]} \n#{opts_parser}")
      end
      opts
    end
  end
end