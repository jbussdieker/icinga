require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:test) do |spec|
  spec.pattern = 'test/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end
