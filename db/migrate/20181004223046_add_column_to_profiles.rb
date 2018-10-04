class AddColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :age, :integer 
    add_column :profiles, :favors_completed, :integer
    add_column :profiles, :favors_offered, :integer
  end
end
