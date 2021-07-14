class Disc < ApplicationRecord
  belongs_to :discs_manufacturer

  validates_presence_of :name,
                        :speed

  validates             :in_production, inclusion: [true, false]


  def self.discs_in_production #calling it on a class w/ self here
    self.where(in_production: true)
  end

  def self.sort_discs_by_alpha #lowercase??? and test for it??
    order(:name)
  end

  def self.over_threshold(number_input)
    self.where('discs.speed > ?', number_input )
  end

end
