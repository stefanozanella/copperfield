When /^Copperfield version is defined$/ do 
  Copperfield.should respond_to(:version)
end

When /^I run "(.*?)" on the command line$/ do |command|
  @cmd_output = `bin/#{command}`
end

When /^I see a message containing a SemVer version number$/ do 
  SemVer.contains_valid?(@cmd_output).should be_true
end
