class AboutController < ApplicationController 

    def index 
        @scientists = Scientist.all.count
        @planets = Planet.all.count 
    end 
end 