require 'active_record'

class Book < ActiveRecord::Base
  has_many :chapters, :dependent => :destroy
  belongs_to :bible
end
