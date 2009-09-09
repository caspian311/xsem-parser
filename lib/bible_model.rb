class BibleModel
  attr_accessor :short_name
  attr_accessor :long_name
  attr_accessor :publisher
  attr_accessor :books

  def initialize(short_name)
    @short_name = short_name
    @books = []
  end
end
