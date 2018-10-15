class FavorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      # @favors = Favor.all
      # @completed = params[:completed] == "true"
      # if @completed
      #     @favor = Favor.completed
      # else 
      #     @favor = Favor.incoplete
      # end 
      respond_to do |format|
          format.html do
              @coordinates = request.location.coordinates.reverse
              @coordinates = [0.0, 0.0] if @coordinates.empty?
          end
          format.json do
              @favors = Favor.where(performer_id: nil)
              render json:  {
                      type: "FeatureCollection",
                      features: @favors.map do |favor|
                        {
                          type: "Feature",
                          geometry: {
                            type: "Point",
                            coordinates: [favor.longitude, favor.latitude]
                          },
                          properties: {
                            category: favor.category,
                            description: favor.description,
                            address: favor.address,
                            id: favor.id,
                            user_name: favor.user.profile.name
                          }
                        }
                      end
                    }
            end
        end

  end

  def new
    @favor = Favor.new
  end 

  def create
    params.permit!
    @favor = Favor.new(favor_params)
    @favor.category =  params[:post][:category].to_i
    @favor.user = current_user
    # notice does not work?
    if @favor.save 

      redirect_to favors_path, notice: 'Favor was successfully created.'
    else
      redirect_to favors_path, alert: "Could not save favor: #{@favor.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    Favor.find(params[:id]).delete 
    redirect_to profiles_path, notice: 'Favor was deleted successfully'
  end

  def update
    @favor = Favor.find(params[:id])
    @favor.update(performer_id: current_user.id) if params[:performer_id]
    @favor.save
    Notification.create(user: @favor.user, performer_id: current_user.id, favor: @favor) if params[:performer_id]
    redirect_to profiles_path
  end 

  def show
    @favor = Favor.find(params[:id])
  end

  def claim
    @favor = Favor.find(params[:favor_id])
    @favor.update!(performer_id: params[:user_id])
    Notification.create(user: @favor.user, performer_id: params[:user_id], favor: @favor)
    redirect_to profiles_path
  end

  private
  def favor_params
    params.require(:post).permit(:user_id, :description, :latitude, :longitude, :ip, :street, :city, :state, :country, :use_current_location, :performer_id )
  end
end
