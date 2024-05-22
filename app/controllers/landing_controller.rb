class LandingController < ApplicationController
  before_action :authenticate_user!

  def index
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        render
    end
end
