require 'rexml/document'

require "lib/book"

include REXML

class AsvParser
  attr_reader :books

  def initialize(file)
    stream_listener = AsvStreamListener.new
    REXML::Document.parse_stream(file, stream_listener)

    @books = stream_listener.books.values
  end
end
