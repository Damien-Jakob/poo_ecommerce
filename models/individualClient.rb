require_relative 'client'

class IndividualClient < Client
  validates :firstname,
            length: {
                minimum: 2,
                maximum: 50,
            }

  validates :lastname,
            length: {
                minimum: 2,
                maximum: 50,
            }

  def to_s
    "#{firstname} #{lastname}"
  end

end
