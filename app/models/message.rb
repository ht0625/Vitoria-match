class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  def message_time
    created_at.strftime('%Y/%m/%d %H:%M')
  end
end
