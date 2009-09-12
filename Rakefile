require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'find'
 
desc 'Default: run unit tests.'
task :default => :test
 
desc 'Test ASV Parser'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Install the ASV Bible into the db (takes a while)'
task :install do
   sh "ruby -Ilib lib/run.rb"
end
