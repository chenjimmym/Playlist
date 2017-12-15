class User < ActiveRecord::Base
  has_many :song_addeds, dependent: :destroy
  has_many :added_songs, through: :song_addeds, source: :song

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence:true, length: {minimum: 8}, on: :create

  has_secure_password
end
