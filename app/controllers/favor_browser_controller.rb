class FavorBrowserController < ApplicationController
    def index
        @favors = Favor.all
    end
end
