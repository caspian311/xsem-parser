class DbImporter
  def initialize(bible_model)
    @bible_model = bible_model
  end

  def import_into_db
    bible = Bible.new
    bible.shortName = @bible_model.short_name
    bible.longName = @bible_model.long_name
    bible.publisher = @bible_model.publisher

    @bible_model.books.each do |book|
      b = Book.new
      b.title = book.title
      bible.books << b
      book.chapters.each do |chapter|
        chap = Chapter.new
        chap.reference = chapter.reference
        b.chapters << chap
        chapter.verses.each do |verse|
          ver = Verse.new
          ver.reference = verse.reference
          ver.text = verse.text
          chap.verses << ver
        end
      end
    end

    bible.save
  end
end
