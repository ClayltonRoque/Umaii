require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { accept_time: @order.accept_time, derpature_address: @order.derpature_address, destination_address: @order.destination_address, finished_time: @order.finished_time, order_status: @order.order_status, order_value: @order.order_value, request_time: @order.request_time, type_order: @order.type_order, user_id_id: @order.user_id_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { accept_time: @order.accept_time, derpature_address: @order.derpature_address, destination_address: @order.destination_address, finished_time: @order.finished_time, order_status: @order.order_status, order_value: @order.order_value, request_time: @order.request_time, type_order: @order.type_order, user_id_id: @order.user_id_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
