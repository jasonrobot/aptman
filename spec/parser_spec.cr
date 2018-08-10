require "./spec_helper.cr"

describe "Parser" do
  describe "#get_mode" do
    it "should find a mode arg" do
      parser = Parser.new %w(-S)

      mode = parser.get_mode
      mode.should_not be_nil
    end

    it "should be nil if no mode arg" do
      parser = Parser.new %w(-foo -b -a)

      mode = parser.get_mode
      mode.should be_nil
    end

    it "should take the first mode of many" do
      args = %w(-u -y -S)
      parser = Parser.new args

      mode = parser.get_mode

      unless mode.nil?
        mode.name.should eq 'S'
      else
        fail "mode was nil when parsing #{args}"
      end
    end
  end

  describe "#get_non_mode_args" do

  end

  describe "#get_operations" do

  end

  describe "#get_targets" do
    it "should not return args with a leading dash" do
      parser = Parser.new %w(-a -b c d)
      parser.get_targets.should eq %w(c d)
    end
  end
end