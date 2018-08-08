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
      if mode.nil?
        fail "mode was nil when parsing #{args}"
      else
        mode.name.should eq 'S'
      end
    end
  end
end
