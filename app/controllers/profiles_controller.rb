class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def index
        @profiles = Profile.all
    end

    def show
        # @profile = Profile.find(params[:id])
    end

    def new 
        @profile = Profile.new
    end 

    def create 
        @profile = Profile.new(profile_params)
        @profile.save 
        redirect_to profiles_path
        # respond_to do |format|
        #     if @profile.save 
        #         format.html {redirect_to profiles_path}
        #     else 
        #         format.html {render :new }
        #     end 
        # end 
    end 

    def edit 
        @profile = Profile.find(params[:id])
    end 

    def update 
    end 

    def delete 
    end

    def destroy
    end 

    private 

    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :age, :favors_completed, :favors_offered, :user_id)
    end 
end
