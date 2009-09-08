require "lib/sql_builder"
require "lib/asv_parser"
require "lib/asv_stream_listener"

parser = AsvParser.new "data/asv-xsem.xml"
sql_builder = SqlBuilder.new parser.books
sql_builder.generate_sql.each do |statement|
	puts statement
end
