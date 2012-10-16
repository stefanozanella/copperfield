require 'uri'
require 'sequel'

module Copperfield
  class Database
    def initialize(uri)
      @uri = uri
    end

    def name
      File.basename URI(@uri).path
    end

    def tables
      database.tables
    end

    private

    def database
      @connection ||= Sequel.connect(@uri)
    end
  end
end
