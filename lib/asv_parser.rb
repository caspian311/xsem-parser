require 'rexml/document'

class AsvParser
  attr_reader :books

  def initialize(stream_listener)
    @stream_listener = stream_listener
  end

  def parse(file)
    REXML::Document.parse_stream(file, @stream_listener)
    @books = @stream_listener.books.values
  end
end
