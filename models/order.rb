class Order < ActiveRecord::Base
  belongs_to :client

  def to_s
    "order of #{client} at #{created_at}"
  end
end