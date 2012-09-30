require 'spec_helper'

describe SemVer do
  describe "#valid?" do
    it "should validate version strings" do
      %w[ 0.0.0 999.999.999 1.3.0 3.5.9 ].each do |valid_semver|
        SemVer.valid?(valid_semver).should be_true
      end
    end
  end

  describe "#contains_valid?" do
    it "should validate versions contained in arbitrary strings" do
      a_string_containing_semver = "Copperfield v0.0.1 Codename LALLA"
      SemVer.contains_valid?(a_string_containing_semver).should be_true
    end
  end

end


