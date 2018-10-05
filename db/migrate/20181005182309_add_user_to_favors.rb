class AddUserToFavors < ActiveRecord::Migration[5.2]
  def change
    add_reference :favors, :user, foreign_key: true
  end
end
