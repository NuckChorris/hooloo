require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  rm_rf 'coverage/'
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
end
