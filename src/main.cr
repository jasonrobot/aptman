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

      parser.on("-S", "install packages") do
        # process = Process.new "apt-get",
        #                       ["install"]
        # process.wait
        package = "foo"
        puts "apt-get install #{package}"
      end

      parser.on("-Ss", "search for packages") do
      end

      parser.on("-Sy", "update databases") do
      end

      parser.on("-Syu", "upgrade packages") do
      end

      parser.on("-R", "remove packages") do
      end

      parser.on("-Rs", "remove packages and deps") do
      end

      parser.on("-Qi", "query info") do
      end

      parser.on("-Qo", "query package owner") do
      end

      parser.on("-Ql", "list files for package") do
      end
    end

    # should be
    # get the mode
    # check if multiple were specified
    # parse each '-' arg corresponding to that mode
    # determins the action(s) to take
    # get the name args
    # go for it

    # ARGV.each do |arg|
    #   mode = get_mode arg
    # end

  end

end

# parser = PacmanParser.new ARGV
puts typeof(ARGV)
