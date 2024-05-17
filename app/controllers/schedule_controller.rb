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
        if @user.update(schedule_array: schedule_array.to_a)
        # Handle successful update
            redirect_to schedule_index_path
        else
        # Handle validation errors
            puts @user.errors.full_messages
        end
    end

    def user_params
        params.permit(:id, :first_name, :last_name, :password, :password_confirmation, :email, :mobile_number, :birthday, :gender, :schedule_array, :schedule)
    end

    def schedule_array
        schedule_array = [0, 0, 0, 0, 0, 0, 0]
        schedule_params = params.dig("user", "schedule_array")
        return schedule_array if schedule_params.nil? 
        schedule_params.each do |index, value|
            schedule_array[index.to_i] = 1 if value == "1"
        end
        schedule_array
    end
end

