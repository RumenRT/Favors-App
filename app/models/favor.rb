class Favor < ApplicationRecord
    validates :description, presence: true
    enum category: { 
        lifting: 0, 
        searching: 1,
        companionship: 2 
    }
    belongs_to :user
    geocoded_by :address
    after_validation :geocode

    def address 
        [street, city, state, country].compact.join(', ')
    end
  end
  