class FavorsController < ApplicationController
    def description
    end

    def index
        @favor = Favor.new
        @completed = params[:completed] == "true"
        if @completed
            @favor = Favor.completed
        else 
            @favor = Favor.incoplete
        end 

    end

    def create
    end

    def destroy
    end

    def update
    end 
end
