require 'spec_helper'

describe Gear do
  it { should validate_numericality_of :teeth }
  it { should validate_numericality_of :radius }
end
