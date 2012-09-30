require 'thor'
require 'copperfield'

module Copperfield
  class CLI < Thor
    desc "version", "Prints Copperfield version and exits"
    def version
      puts "Copperfield #{Copperfield.version}"
    end
  end
end
