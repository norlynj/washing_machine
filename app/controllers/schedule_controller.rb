class ScheduleController < ApplicationController

    
    def index
        @users = User.all
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        @find_user = User.find_by(params[:user_id])
    end

    def edit
        @user = User.find(params[:id])
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        # Handle successful update
            redirect_to edit_schedule_path(@user.id)
        else
        # Handle validation errors
            puts @user.errors.full_messages
        end
    end

    def user_params
        params.permit(:id, :first_name, :last_name, :password, :password_confirmation, :email, :mobile_number, :birthday, :gender, :schedule_array, :schedule)
    end
end

