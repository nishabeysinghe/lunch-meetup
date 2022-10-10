class Team < ApplicationRecord
    before_destroy :destroy_blind_dates
    validates :name, presence: true,  uniqueness: true

    has_many :blind_dates
    has_many :employees, :through => :blind_dates

    private

    def destroy_blind_dates
        self.blind_dates.destroy_all
    end  
end
