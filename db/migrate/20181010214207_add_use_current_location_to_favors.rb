class AddUseCurrentLocationToFavors < ActiveRecord::Migration[5.2]
  def change
    add_column :favors, :use_current_location, :boolean, null: false, default: false
  end
end
