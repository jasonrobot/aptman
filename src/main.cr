## Main entry point

require "option_parser"

class PacmanParser 

  getter? sync : Bool = false,
          search : Bool = false,
          remove : Bool = false,
          query : Bool = false

  def initialize(args)
    
    OptionParser.parse args do |parser|

      parser.banner = "usage:  aptman <operation> [...]
operations:
    aptman {-h --help}
    aptman {-V --version}
    aptman {-D --database} <options> <package(s)>
    aptman {-F --files}    [options] [package(s)]
    aptman {-Q --query}    [options] [package(s)]
    aptman {-R --remove}   [options] <package(s)>
    aptman {-S --sync}     [options] [package(s)]
    aptman {-T --deptest}  [options] [package(s)]
    aptman {-U --upgrade}  [options] <file(s)>

use 'aptman {-h --help}' with an operation for available options"

      parser.on("-S", "sync") do
        @sync = true
      end

      parser.on("-Ss", "search") do
        @search = true
      end
      
      parser.on("-h", "--help", "Show this help") do
        puts parser
      end      
    end
    
  end

end

parser = PacmanParser.new ARGV

puts parser.sync?
puts parser.search?
