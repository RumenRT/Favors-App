class AddColumnsToFavors < ActiveRecord::Migration[5.2]
  def change
    add_column :favors, :description, :string
    add_column :favors, :latitude, :float 
    add_column :favors, :longitude, :float
    add_column :favors, :ip, :string
    add_column :favors, :street, :string
    add_column :favors, :city, :string
    add_column :favors, :state, :string
    add_column :favors, :country, :string
  end
end
