class UsersController < ApplicationController
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




    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

end
