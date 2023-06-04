class PatientCardsQuery
  attr_reader :relation

  def initialize(relation = PatientCard.includes(:patient).all)
    @relation = relation
  end

  def search(query)
    return self unless query.present?

    query = query.downcase
    @relation = relation.joins(:patient).where('lower(patients.first_name) LIKE ?', "%#{query}%")
    self
  end

  def sort(field, direction)
    case field
    when 'created_at'
      @relation = relation.order("created_at #{direction}")
    else
      @relation = relation.order(:id)
    end
    self
  end

  def result
    @relation
  end
end
