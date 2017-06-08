class Message < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  after_create_commit { MessageBroadcastJob.perform_later self }
end
