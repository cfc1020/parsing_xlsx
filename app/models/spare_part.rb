class SparePart < ActiveRecord::Base
  belongs_to :section
  validates :section, :presence => true
end
