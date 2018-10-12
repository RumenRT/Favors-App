class Profile < ApplicationRecord
    has_many :favors
    belongs_to :user

    def name
        "#{first_name} #{last_name}"
    end
end
