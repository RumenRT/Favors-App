class Favor < ApplicationRecord
    enum category: { 
        lifting: 0, 
        searching: 1,
        companionship: 2 
    }
    belongs_to :user
  end
  