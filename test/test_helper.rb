require 'minitest/autorun'

# Load the application files
Dir['lib/**/*.rb'].each { |file| require_relative "../#{file}" }
