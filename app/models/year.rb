class Year < ActiveRecord::Base
  has_many :sections, :dependent => :destroy
  belongs_to :model
  validates :model, :presence => true
end
