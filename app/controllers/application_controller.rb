class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :send_user_to_create_profile_unless_profile_exists
    # before_action :check_for_profile

    private
    def send_user_to_create_profile_unless_profile_exists
        unless devise_controller? || current_user.profile 
            redirect_to new_profile_path
        # else 
        #     redirect_to 'http://localhost:3000/profiles'
        end 
    end

    # def check_for_profile 
    #     if current_user.profile.nil?
    #         redirect_to new_profile_path
    #     else 
    #         redirect_to 'http://localhost:3000/profiles' 
    #     end 
    # end 

end
