require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'find'
require 'rubygems'
gem 'ci_reporter'
require 'ci/reporter/rake/test_unit'
 
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
   ARGV.shift
   sh "ruby -Ilib lib/load.rb " + ARGV.join(" ")
end

desc 'Write the ASV file to a pipe formatted file'
task :pipe do
   ARGV.shift
   sh "ruby -Ilib lib/pipe_file_writer.rb " + ARGV.join(" ")
end
