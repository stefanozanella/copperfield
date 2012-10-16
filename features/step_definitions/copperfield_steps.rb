When /^Copperfield version is defined$/ do 
  Copperfield.should respond_to(:version)
end

When /^I run "(.*?)" on the command line$/ do |command|
  @cmd_output = `bin/#{command}`
end

When /^I see a message containing a SemVer version number$/ do 
  SemVer.contains_valid?(@cmd_output).should be_true
end

When /^a database in "(.*?)" with the following tables:$/ do |database, tables|
  @db = Sequel.sqlite database
  tables.hashes.each do |table|
    @db.create_table table['Name'].to_sym do
      primary_key :id
    end
  end
end

When /^I see$/ do |output|
  output.should == @cmd_output
end
