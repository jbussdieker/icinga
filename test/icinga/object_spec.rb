require 'icinga'

describe Icinga::Object do
  before do
    @object = Icinga::Object.new(nil, {"object"=>"name"})
  end

  describe "when created" do
    it "should populate name" do
      @object.name.should match(/^name$/)
    end
  end
end
