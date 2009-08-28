require 'rexml/document'

# get the XML data as a string
xml_file = File.new("asv-usfx.xml");

# extract event information
doc = REXML::Document.new xml_file

books = []
doc.elements.each('usfx/book') do |book|
   books << book.elements["h"].text
end

# print all events
puts "all titles..."
books.each do |book|
   print "#{book}\n"
end
