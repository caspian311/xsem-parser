require 'active_record'

require "asv_parser"
require "asv_stream_listener"
require "bible_model"
require "db_importer"
require "bible"
require "book"
require "chapter"
require "verse"

ActiveRecord::Base.establish_connection(
      :adapter => 'mysql',
      :database => 'bible',
      :host => '127.0.0.1',
      :username => 'root',
      :password => 'root')

parser = AsvParser.new
parser.parse File.open(File.dirname(__FILE__) + '/../data/asv-xsem.xml')

bible_model = BibleModel.new 'ASV'
bible_model.long_name = 'American Standard Version'
bible_model.books = parser.books

importer = DbImporter.new bible_model
importer.import_into_db
