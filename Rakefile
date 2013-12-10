require 'rspec/core/rake_task'

namespace :test do
  desc 'Run all spec tests'
  RSpec::Core::RakeTask.new do |task|
    task.pattern = Dir['spec/**/*_spec.rb'].sort
    task.rspec_opts = Dir.glob("[0-9][0-9][0-9]_*").collect { |x| "-I#{x}" }
    task.rspec_opts << '--color -f d'
  end
end

task :test => "test:spec"

task :default => :test
