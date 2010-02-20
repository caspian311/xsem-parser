require "xsem_parser"
require "xsem_stream_listener"
require "bible_model"

parser = XsemParser.new

data_file = ARGV[0]
pipe_filename = ARGV[1]

bible = parser.parse data_file

lines = []

bible.books.each do |book|
  title = book.title
  book.chapters.each do |chap|
    chapter = chap.reference
    chap.verses.each do |v|
      verse = v.reference
      text = v.text.gsub("\n", " ").chomp

      line = title + '|' + chapter + '|' + verse + '|' + text + "\n"
      lines << line
    end
  end
end

lines.each do |line|
  File.open(pipe_filename, 'a+') {|f| f.write(line) }
end
