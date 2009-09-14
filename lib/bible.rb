require 'active_record'

class Bible<ActiveRecord::Base
  has_many :books, :dependent => :destroy
end
