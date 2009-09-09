require 'active_record'

ActiveRecord::Base.establish_connection(
      :adapter => 'mysql',
      :database => 'bible_test',
      :host => '127.0.0.1',
      :username => 'root',
      :password => 'root')
