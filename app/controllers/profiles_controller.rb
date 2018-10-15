class ProfilesController < ApplicationController
    skip_before_action :send_user_to_create_profile_unless_profile_exists, only: [:new, :create]

    def index
        @profiles = current_user.profile
        @favors = current_user.favors
        @performer_favors = current_user.performing_favors 
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

    def check_box_completed
       @profile = Profile.where(:user_id => current_user.id).last
       @profile.favors_completed = @profile.favors_completed.to_i + 1
       @favor = Favor.find(params[:favor_id])
       @favor.completed = true
       redirect_to profiles_path
    end

    private 

    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :age, :favors_completed, :favors_offered, :favor_id)
    end 
end
