# To change this template, choose Tools | Templates
# and open the template in the editor.

class SqlBuilder
  def initialize(books)
    @books = books
  end

  def generate_sql
    generated_sql = []
    @books.each do |book|
      book.chapters.each do |chapter|
        chapter.verses.each do |verse|
          sql = create_insert_statement(book, chapter, verse)
          generated_sql << sql
        end
      end
    end
    return generated_sql
  end

  private

  def create_insert_statement(book, chapter, verse)
    return 'create this...'
  end
end
