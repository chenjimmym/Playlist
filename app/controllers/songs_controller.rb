class SongsController < ApplicationController
    def index
        @current_user = current_user
        @songs = Song.all
        render 'index'
    end
    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to '/songs'
        else
            flash[:errors] = @song.errors.full_messages
            redirect_to '/songs'
        end
    end
    def add
        @song_added = SongAdded.new(user: current_user, song: Song.find(params[:song]))
        puts '##################', @song_added.inspect
        @song_added.save
        redirect_to '/songs'
    end
    def show
        @song = Song.find(params[:id])
        # @song.added_users
        @users = @song.added_users.select(:first_name, :last_name).group(:first_name, :last_name, :id, :email).having("count(*) > 0").all.size
        puts '$$$$$$$$$$$$$$$$$$$$$', @users
        render 'show'
    end

    private
    def song_params
        params.require(:song).permit(:title, :artist)
    end
end
