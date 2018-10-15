class AddReadStatusToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :read_status, :boolean, :default => false 
  end
end
