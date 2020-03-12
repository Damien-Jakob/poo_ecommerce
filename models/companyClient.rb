require_relative 'client'

class CompanyClient < Client
  validates :name,
            length: {
                minimum: 2,
                maximum: 50,
            }

  def to_s
    name
  end

end
