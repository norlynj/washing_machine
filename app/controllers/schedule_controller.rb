class ScheduleController < ApplicationController
    def index
        @schedules = Schedule.all
        @users = User.all
    end
end
