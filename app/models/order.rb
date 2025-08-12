class Order < ApplicationRecord
  belongs_to :user
  validates :departure_address, presence: true
  validates :destination_address, presence: true
  belongs_to :driver, class_name: "User", optional: true
end
