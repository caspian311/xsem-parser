class Bible<ActiveRecord::Base
  has_many :books, :dependent => :destroy
end
