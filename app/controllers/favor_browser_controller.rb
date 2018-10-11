class FavorBrowserController < ApplicationController
    def index
        @foo = "hello world"
        @favor = Favor.all
        @methods = @favor.methods.reject{|m| m.to_s.include? 'a'}
    end

end
