require 'active_record'

require "xsem_parser"
require "xsem_stream_listener"
require "bible_model"
require "db_importer"
require "bible"
require "book"
require "chapter"
require "verse"

db_config = YAML::load(File.open(File.dirname(__FILE__) + '/../config/prod.yml'))
ActiveRecord::Base.establish_connection(db_config)

parser = XsemParser.new

ARGV.each do |data_file|
	bible = parser.parse data_file

	importer = DbImporter.new bible
	importer.import_into_db
end
