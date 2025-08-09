class Order < ApplicationRecord
  belongs_to :user
  validates :departure_address, presence: true
  validates :destination_address, presence: true
end
