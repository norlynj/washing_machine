class ScheduleController < ApplicationController
    def index
        @Schedule = Schedule.all
    end
end
