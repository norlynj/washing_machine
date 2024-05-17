class ScheduleController < ApplicationController
    def index
        @users = User.all
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
    end
end
