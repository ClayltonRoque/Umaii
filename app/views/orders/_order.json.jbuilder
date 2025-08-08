json.extract! order, :id, :user_id, :type_order, :departure_address, :destination_address, :order_status, :request_time, :accept_time, :finished_time, :order_value, :created_at, :updated_at
json.url order_url(order, format: :json)
