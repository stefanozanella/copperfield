require 'spec_helper'
module Copperfield
  describe CLI do
    before do
      ARGV.replace []
    end

    it "is a Thor subclass" do
      Copperfield::CLI.should be < Thor
    end

    describe "#version" do
      it "prints Copperfield version" do
        output = capture(:stdout) { Copperfield::CLI.start ["version"] }
        output.should match Copperfield.version
      end
    end
  end

end
