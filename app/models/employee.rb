class Employee < ApplicationRecord
    before_destroy :destroy_blind_dates
    validates :emp_id, presence: true,  uniqueness: true
    validates :department, presence: true 

    has_many :blind_dates
    has_many :teams, :through => :blind_dates


    private

    def destroy_blind_dates
        self.blind_dates.destroy_all
    end
end
