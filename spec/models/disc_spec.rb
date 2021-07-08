require 'rails_helper'

RSpec.describe Disc, type: :model do
  it {should belong_to :discs_manufacturer}
end
