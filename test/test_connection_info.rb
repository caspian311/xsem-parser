require 'active_record'

db_config = YAML::load(File.open(File.dirname(__FILE__) + '/../config/test.yml'))
ActiveRecord::Base.establish_connection(db_config)
