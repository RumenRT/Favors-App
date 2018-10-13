class Notification < ApplicationRecord
  belongs_to :favor
  belongs_to :user
end
