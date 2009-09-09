class DbImporter
  def initialize(book_provider)
    @book_provider = book_provider
  end

  def import_into_db
    @book_provider.books.each do |book|
      b = Book.new
      b.title = book.title
      b.save
    end
  end
end
