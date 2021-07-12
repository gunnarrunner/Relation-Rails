class Disc < ApplicationRecord
  belongs_to :discs_manufacturer

  validates_presence_of :name,
                        :speed

  validates             :in_production, inclusion: [true, false]

  def self.sort_discs_by_alpha
    self.sort(:name)
  end

  def self.discs_in_production #calling it on a class w/ self here
    self.where(in_production: true)
  end
end
