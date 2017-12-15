class Song < ActiveRecord::Base
    has_many :song_addeds, dependent: :destroy
    has_many :added_users, through: :song_addeds, source: :user

    validates :title, :artist, presence: true, length: {minimum: 2}
end
