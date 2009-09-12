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
parser.parse File.dirname(__FILE__) + '/../data/asv.xml'

bible_model = BibleModel.new 'ASV'
bible_model.long_name = 'American Standard Version'
bible_model.books = parser.books

importer = DbImporter.new bible_model
importer.import_into_db