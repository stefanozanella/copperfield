require 'spec_helper'

module Copperfield
  describe Database do
    describe "#name" do
      context "when the database URI contains a relative path to a file" do
        it "returns the basename of the file" do
          uri = "sqlite://features/fixtures/test.db"
          db = Database.new(uri)
          db.name.should == 'test.db'
        end
      end

      context "when the database URI contains a database name appended to a hostname" do
        it "returns the database name" do
          uri = "postgresql://demo:test@some.database.host.com/test"
          db = Database.new(uri)
          db.name.should == 'test'
        end
      end
    end

    describe "#tables" do
      before do
        mock_database = double('database').as_null_object
        mock_database.stub(:tables) { ['one', 'two', 'three'] }
        Sequel.stub(:connect) { mock_database }
      end

      it "returns the names of tables in the database" do
        uri = "sqlite://features/fixtures/test.db"
        db = Database.new(uri)
        db.tables.should == ['one', 'two', 'three']
      end
    end
  end
end
