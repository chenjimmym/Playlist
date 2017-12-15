class UsersController < ApplicationController

    skip_before_action :require_login, only: [:index, :create]

    def index
        render "index"
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:errors] = ['Successfully Registered']
            redirect_to "/"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        @user = User.find(params[:id])
        @songs = @user.added_songs.select(:title).group(:artist, :title).having("count(*) > 0").all.size
        puts "$$$$$$$$$$$", @songs
        render 'show'
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

end
