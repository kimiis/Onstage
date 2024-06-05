class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  # has_many :conversations, through: :sent_messages
  has_many :stages
  has_many :artists
  has_many :ads

  def artist?
    artists.exists?
  end

  def all_conversations
    out = self.sent_messages.map { |m| m.conversation }.uniq << self.received_messages.map {|m| m.conversation}.uniq
    out.flatten.uniq
  end
end
