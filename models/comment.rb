class Comment < ActiveRecord::Base
  belongs_to :subject, polymorphic: true

  def to_s
    content
  end
end