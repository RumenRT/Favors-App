class AddCompletedToFavors < ActiveRecord::Migration[5.2]
  def change
    add_column :favors, :completed, :boolean
  end
end
