require 'lib/AsvParser'
require 'lib/AsvStreamListener'
require 'lib/DbImporter'
require 'lib/BibleModel'

Bible.all.each do |bible|
  bible.destroy
end

parser = AsvParser.new(AsvStreamListener.new)
parser.parse File.open(File.dirname(__FILE__) + '/../data/asv-xsem.xml')

bible_model = BibleModel.new 'ASV'
bible_model.long_name = 'American Standard Version'
bible_model.books = parser.books

importer = DbImporter.new bible_model
importer.import_into_db
