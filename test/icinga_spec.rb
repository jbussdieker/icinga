require 'icinga'

describe Icinga do
  it "should have a version" do
    Icinga::VERSION.should be_kind_of(String)
  end
end
