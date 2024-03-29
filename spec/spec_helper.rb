$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'rspec'

require 'copperfield'
require 'copperfield/cli'
require 'semver'
require 'sequel'

RSpec.configure do |config|
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end
end
