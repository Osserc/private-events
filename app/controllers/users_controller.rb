class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def check_panel_owner
        if user_signed_in?
            return true if current_user.id == @user.id
            return false
        else
            return false
        end
    end
    helper_method :check_panel_owner
end