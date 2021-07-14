class Player < ApplicationRecord
  # validates :
  belongs_to :team

  def self.visible_healthy
    where(healthy: :true)
  end

  def self.players_alphabetically
    order("LOWER(name)")
  end
end