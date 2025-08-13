
class Order < ApplicationRecord
  belongs_to :user
  validates :departure_address, presence: true
  validates :destination_address, presence: true
  belongs_to :driver, class_name: "User", optional: true

  after_initialize :set_default_status, if: :new_record?
  before_create :set_request_time

  private

  def set_default_status
    self.order_status ||= "pending"
  end

  def set_request_time
    self.request_time ||= Time.current
  end
end
