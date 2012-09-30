require 'spec_helper'

describe Copperfield do
  describe "#version" do
    it "should be a valid SemVer" do
      SemVer.should be_valid Copperfield.version
    end
  end
end
