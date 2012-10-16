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

    describe "#list" do
      context "when no database is given" do
        it "returns an error" do
          output = capture(:stderr) { Copperfield::CLI.start ["list"] }
          output.should_not be_empty
        end
      end

      context "when a database URL is given" do
        let(:database) { double('database').as_null_object }

        before do
          database.stub(:name).and_return 'test.db'
          database.stub(:tables).and_return ['one','two','three']
          Database.stub(:new) { database }
        end

        describe "the name of the database" do
          it "fetches it" do
            database.should_receive(:name)
  
            capture(:stdout) { Copperfield::CLI.start [
                        "list", "--database=sqlite://test.db"] }
          end
  
          it "prints it" do
            output = capture(:stdout) { Copperfield::CLI.start [
                        "list", "--database=sqlite://test.db"] }
            output.should match "database 'test.db'"
          end
        end

        describe "the tables in the database" do
          it "fetches their names" do
            database.should_receive(:tables) 
            capture(:stdout) { Copperfield::CLI.start [
                        "list", "--database=sqlite://test.db"] }
          end 

          it "prints their names" do
            output = capture(:stdout) { Copperfield::CLI.start [
                        "list", "--database=sqlite://test.db"] }
            output.should match "one"
            output.should match "two"
            output.should match "three"
          end
        end
      end
    end
  end

end
