class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, foreign_key: true # TODO the is not needed
      t.belongs_to :favor, foreign_key: true
      t.integer :performer_id

      t.timestamps
    end
  end
end
