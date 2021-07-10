require 'rails_helper'

RSpec.describe Disc, type: :model do
  it {should belong_to :discs_manufacturer}
  it {should validate_presence_of :name}
  it {should validate_presence_of :speed}
  it {should allow_value(true).for(:in_production)}
  it {should allow_value(true).for(:in_production)}
  it {should allow_value(true).for(:in_production)}

end
