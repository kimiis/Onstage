class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :conversation

  validates(:content, presence: true)

  def sender?(a_user)
    sender.id == a_user.id
  end
end
