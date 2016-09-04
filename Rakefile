require 'rake/testtask'
require 'ci/reporter/rake/rspec'
require 'rspec/core/rake_task'

task :default => [:spec]

desc 'Run rspec based test'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList["spec/*_spec.rb", "spec/*/*_spec.rb"]
end

task :spec => 'ci:setup:rspec'
