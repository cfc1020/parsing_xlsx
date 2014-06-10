class Section < ActiveRecord::Base
  has_many :spare_parts, :dependent => :destroy
  belongs_to :year
  validates :year, :presence => true
end
