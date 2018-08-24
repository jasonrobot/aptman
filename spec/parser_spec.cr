require "./spec_helper.cr"

describe "Parser" do
  # describe "#get_arguments" do
  #   parser = Parser.new %w(-a --arg-b -c -D)
  #   parser.get_arguments.should eq %w(a arg-b c D)
  # end

  describe "#get_targets" do
    it "should not return args with a leading dash" do
      parser = Parser.new %w(-a -b c d)
      parser.get_targets.should eq %w(c d)
    end
  end

  describe "#explode_args" do
    it "should return a flat array" do
      parser = Parser.new %w(-s -abc -y)
      typeof( parser.explode_args).should eq( Array(String) )
    end

    it "should split up combined args" do
      parser = Parser.new %w(-abcdef)
      parser.explode_args.should eq( %w(a b c d e f) )
    end

    it "should include both args when one is repeated" do
      parser = Parser.new %w(-aaa)
      parser.explode_args.should eq( %w(a a a) )
    end
  end
end
