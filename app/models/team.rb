class Team < ApplicationRecord
  has_many :feature_teams, dependent: :destroy
  has_many :features, through: :feature_teams
  
  validates :name, presence: true, length: { maximum: 20 }
end
