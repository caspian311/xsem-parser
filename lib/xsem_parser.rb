require 'rexml/document'

class XsemParser
  attr_reader :books

  def parse(filename)
    @books = []
    stream_listener = XsemStreamListener.new
    REXML::Document.parse_stream(File.open(filename), stream_listener)
    @books = stream_listener.books.values
  end
end
