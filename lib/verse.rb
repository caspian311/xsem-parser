class Verse < ActiveRecord::Base
  belongs_to :chapter, :dependent => :destroy
end
