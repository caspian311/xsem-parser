class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :verses, :dependent => :destroy
end
