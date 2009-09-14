require 'rexml/document'

class XsemParser
  attr_reader :books

  def parse(filename)
    stream_listener = XsemStreamListener.new
    REXML::Document.parse_stream(File.open(filename), stream_listener)
    @bible = stream_listener.bible
  end
end
