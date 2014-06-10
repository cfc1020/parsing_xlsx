class Model < ActiveRecord::Base
  has_many :years, :dependent => :destroy
  belongs_to :mark
  validates :mark, :presence => true
end
