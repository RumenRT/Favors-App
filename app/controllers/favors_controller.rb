class FavorsController < ApplicationController
    def description
    end

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
                @favors = Favor.all
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
                              id: favor.id
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
      @favor = Favor.new(params[:post])
      @favor.user = current_user
      # notice does not work?
      if @favor.save 
         redirect_to favors_path,
          notice: 'Favor was successfully created.'
      else
        redirect_to favors_path,
          alert: "Could not save favor: #{@favor.errors.full_messages.join(', ')}"
      end
    end

    def destroy
    end

    def update
    end 
end
