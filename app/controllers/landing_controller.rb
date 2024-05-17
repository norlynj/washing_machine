class LandingController < ApplicationController
    
    def index
        @weekdays = ['S', 'M', 'T', 'W', 'Th', 'F', 'S']
        render
        
    end
end
