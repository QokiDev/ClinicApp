json.extract! doctor, :id, :name, :department_id, :specialization_id, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
