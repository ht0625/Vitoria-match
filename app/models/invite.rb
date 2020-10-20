class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :place, length: { maximum: 30 }
  validates :detail, length: { maximum: 400 }
  validate  :date_time_not_before_now

  def date_time_not_before_now
    errors.add(:match_day, "は未来の日時を選択してください") if match_day.nil? || match_day < DateTime.now
  end
end
