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

      parser.on("-h", "--help", "Show this help") do
        puts parser
      end      
    end

    # should be
    # get the mode
    # check if multiple were specified
    # parse each '-' arg corresponding to that mode
    # determins the action(s) to take
    # get the name args
    # go for it
    
    ARGV.each do |arg|
      mode = get_mode arg
    end
    
  end

end

parser = PacmanParser.new ARGV
puts typeof(ARGV)

puts parser.sync?
puts parser.search?
