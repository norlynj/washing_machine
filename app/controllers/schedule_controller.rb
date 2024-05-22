class ScheduleController < ApplicationController
    before_action :authenticate_user!
    before_action :manager_signed_in?

    def index
        @users = User.where(role: :staff).where.not(status: "deleted")
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        @find_user = User.find_by(params[:user_id])

        if params[:search].present?
            @users = @users.where("first_name LIKE :search OR last_name LIKE :search", search: "%#{params[:search]}%")
        end
    end

    def edit
        @user = User.find(params[:id])
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
    end

    def update
        @user = User.find(params[:id])
        if @user.update(schedule_array: schedule_array.to_a)
        # Handle successful update
            redirect_to schedule_index_path, notice: "Schedule updated successfully"
        else
        # Handle validation errors
            puts @user.errors.full_messages
            redirect_to schedule_index_path, alert: "Schedule update unsuccessful"
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

    private
    def manager_signed_in?
      if current_user.staff?
        redirect_to landing_page_path, alert: "You are not allowed to access the page"
      end
    end
end

