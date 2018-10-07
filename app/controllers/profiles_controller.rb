class ProfilesController < ApplicationController
    skip_before_action :send_user_to_create_profile_unless_profile_exists, only: [:new, :create]

    def index
        @profiles = current_user.profile
    end

    def show
        # @profile = Profile.find(params[:id])
    end

    def new 
        @profile = Profile.new
    end 

    def create 
        @profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
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
        params.require(:profile).permit(:first_name, :last_name, :age)
    end 
end
