class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true

  after_create_commit { NotificationBroadcastJob.perform_later(self) }

  def receiver
    self.conversation.with(self.user)
  end
end
