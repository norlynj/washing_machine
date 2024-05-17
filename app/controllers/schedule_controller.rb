class ScheduleController < ApplicationController
    def index
        @users = User.all
    end
end
