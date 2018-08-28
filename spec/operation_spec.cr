require "./spec_helper.cr"

describe "Operation" do

  describe "add_action" do

    it "should be able to add actions" do
      operation = Operation.new "oper", "does operation"

      operation.add_action( Action.new( "f", "foo" ) )

    end

  end

  describe "is_action" do
      operation = Operation.new "oper", "does operation"

      operation.add_action( Action.new( "f", "foo" ) )
      operation.has_action?( "f" ).should eq true
      operation.has_action?( "foo" ).should eq true
      operation.has_action?( "bar" ).should eq false
  end

end
