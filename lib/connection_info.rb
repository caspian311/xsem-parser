require 'active_record'

ActiveRecord::Base.establish_connection(
      :adapter => 'mysql',
      :database => 'bible_dev',
      :host => '127.0.0.1',
      :username => 'root',
      :password => 'root',
      :pool => '5',
      :timeout => '5000')