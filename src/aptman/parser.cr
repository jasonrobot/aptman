# My very own options parser to emulate pacman

require "./operation.cr"
require "./argument.cr"

# Parser for command line args to aptman
# This is mean to emulate how pacman works on Arch Linux
class Parser

  # @dash_args : Array(String)

  def initialize(@args : Array(String))

    # This is stupid:
    # @args_present = Hash(String, Int32).new
    # explode_args.each do |arg|
    #   if @args_present.has_key? arg
    #     @args_present[arg] = @args_present[arg] + 1
    #   else
    #     @args_present[arg] = 1
    #   end
    # end

  end

  def add_operation(op : Operation)
    @operations << op
  end

  # Get the major mode for the command.
  def get_operation
  end

  # Make the array of command line args into an array of strings of args without dashes
  def explode_args() : Array(String)
    @args.map do |arg|
      # if single dash
      if arg =~ /^-[^-]/
        # return the parts
        arg[1, arg.size].chars.map &.to_s
      elsif arg =~ /^--[^-]/
        # if double dash
        # return the arg without leading double dashes
        arg[2, arg.size]
      else
        # otherwise, this is a target arg, remove it
      end
    end.flatten.compact
  end

  # Get the target names/patterns/files for the command
  def get_targets
    @args.select { |arg| !arg.starts_with? '-' }
  end

end
