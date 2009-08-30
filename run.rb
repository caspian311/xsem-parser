require 'REXML/document'
require 'app/stream_parser'

include REXML

parser = StreamParser.new
Document.parse_stream(File.open('data/asv-xsem.xml'), parser)
