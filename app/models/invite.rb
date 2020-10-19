class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :place, length: { maximum: 30 }
  validates :detail, length: { maximum: 400 }
end
