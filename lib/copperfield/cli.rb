require 'thor'
require 'uri'

require 'copperfield'

module Copperfield
  class CLI < Thor
    desc "version", "Prints Copperfield version and exits"
    def version
      puts "Copperfield #{Copperfield.version}"
    end

    desc "list", "Shows the names of available tables in specified database"
    method_option :database, :required => true
    def list
      db = Database.new options[:database]
      puts "Tables found in database '#{db.name}':"
      puts ""
      db.tables.each do |table|
        puts "#{table}"
      end
    end
  end
end
