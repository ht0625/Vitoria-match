class Feature < ApplicationRecord
  has_many :feature_teams, dependent: :destroy
  has_many :teams, through: :feature_teams
  
  validates :label, presence: true, length: { maximum: 10 }
end
