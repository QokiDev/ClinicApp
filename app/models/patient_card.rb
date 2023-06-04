class PatientCard < ApplicationRecord
  belongs_to :department
  belongs_to :doctor
  belongs_to :patient
end
