# test/test_helper.rb
require 'minitest/autorun'

# Load the application files
# require_relative '../lib/*'
Dir["lib/**/*.rb"].each {|file| 
  require_relative "../#{file}" 
}
