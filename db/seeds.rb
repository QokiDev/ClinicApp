for i in 1..100
  spec = Specialization.new(name: 'Specialization ' + i.to_s)
  spec.save

  dep = Department.new(name: 'Department ' + i.to_s, address: i.to_s, founding_date: '03.03.2000')
  dep.save

  doc = Doctor.new(name: 'Doctor ' + i.to_s, department: dep, specialization: spec)
  doc.save

  pat = Patient.new(first_name: 'Ivan ' + i.to_s, last_name: 'Ivanov ' + i.to_s, date_of_birth: '01.01.2003')
  pat.save

  patcard = PatientCard.new(patient: pat, department: dep, doctor: doc)
  patcard.save
end