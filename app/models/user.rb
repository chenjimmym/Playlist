class User < ActiveRecord::Base
  has_many :song_addeds, dependent: :destroy
  has_many :added_songs, through: :song_addeds, source: :song

  has_secure_password
end
