require 'minitest/spec'
require 'simplecov'
require 'minitest/autorun'

SimpleCov.start do
  add_filter '/spec/'
  command_name 'MiniTest'
end
