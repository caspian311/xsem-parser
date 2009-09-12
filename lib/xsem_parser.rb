require 'rexml/document'

class XsemParser
  attr_reader :books

  def initialize
    @stream_listener = XsemStreamListener.new
  end

  def parse(file)
    REXML::Document.parse_stream(file, @stream_listener)
    @books = @stream_listener.books.values
  end
end
