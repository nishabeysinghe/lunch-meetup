class BlindDate < ApplicationRecord
  belongs_to :employee
  belongs_to :team
  validates_uniqueness_of :employee_id, :scope => :team_id

end
