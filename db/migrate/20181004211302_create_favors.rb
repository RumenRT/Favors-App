class CreateFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :favors do |t|

      t.timestamps
    end
  end
end
