class Disc < ApplicationRecord
  belongs_to :discs_manufacturer

  validates_presence_of :name,
                        :speed

  validates             :in_production, inclusion: [true, false]

  def sort_discs_by_alpha
    self.discs.sort(:name)
  end
end
