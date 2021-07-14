class Team < ApplicationRecord
  # validates :
  has_many :players, dependent: :delete_all

  def self.order_create_date
    order(created_at: :desc)
  end

  def count_players
    players.count
  end
end