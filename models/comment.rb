class Comment < ActiveRecord::Base
  # good alternative name : commentable
  belongs_to :subject, polymorphic: true

  def to_s
    content
  end
end