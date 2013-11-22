class Gear < ActiveRecord::Base
  validates_numericality_of :teeth, :greater_than => 0, :only_integer => true
  validates_numericality_of :radius, :greater_than => 0
end
