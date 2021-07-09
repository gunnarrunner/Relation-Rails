class Team < ApplicationRecord
  # validates :
  has_many :players

  def self.order_create_date
    order(created_at: :desc)
  end

  def count_players
    players.count
  end
end