class Favor < ApplicationRecord
    validates :description, presence: true
    enum category: { 
        lifting: 0, 
        searching: 1,
        companionship: 2 
    }
    belongs_to :user
    belongs_to :performer, class_name: "User", optional: true

    def address 
        [street, city, state, country].compact.join(', ')
    end

    geocoded_by :address
    before_validation :delete_address, if: :use_current_location
    after_validation :geocode, if: -> {address.present?}

    def delete_address
        self.street   = nil
        self.city     = nil
        self.state    = nil
        self.country  = nil
    end
    
    def has_location?
        self.latitude.present? && self.longitude.present?
    end
end
  