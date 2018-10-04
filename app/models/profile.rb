class Profile < ApplicationRecord
    has_many :favors
    belongs_to :user
end
