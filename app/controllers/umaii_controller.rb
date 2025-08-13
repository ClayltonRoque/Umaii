class UmaiiController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user&.user_type == "motorista"
      redirect_to orders_path, alert: "Motoristas não podem acessar a home."
      return
    end

    @orders = current_user.orders.includes(:driver).order(created_at: :desc)

    if params[:type_order].present?
      @orders = @orders.where(type_order: params[:type_order])
    end

    if params[:order_status].present?
      @orders = @orders.where(order_status: params[:order_status])
    end

    if params[:driver_name].present?
      @orders = @orders.joins("LEFT JOIN users drivers ON drivers.id = orders.driver_id")
                       .where("drivers.name ILIKE ?", "%#{params[:driver_name]}%")
    end

    respond_to do |format|
      format.html
    end
  end
end
