class AddCategoryToFavors < ActiveRecord::Migration[5.2]
  def change
    add_column :favors, :category, :integer
  end
end
