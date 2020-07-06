class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username
  validates_presence_of :username
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
end
