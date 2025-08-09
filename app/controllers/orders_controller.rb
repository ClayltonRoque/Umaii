class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    if params[:user_id]
      @orders = Order.where(user_id: params[:user_id])
      # Filtro por descrição
      if params[:description_items].present?
        @orders = @orders.where("description_items ILIKE ?", "%#{params[:description_items]}%")
      end
      # Ordenação por valor
      if params[:order_value_sort].present?
        direction = params[:order_value_sort] == "desc" ? :desc : :asc
        @orders = @orders.order(order_value: direction)
      end
      # Ordenação por data
      if params[:date_sort].present?
        direction = params[:date_sort] == "desc" ? :desc : :asc
        @orders = @orders.order(request_time: direction)
      end
    else
      @orders = Order.all
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_path, status: :see_other, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :type_order, :departure_address, :destination_address, :order_status, :request_time, :accept_time, :finished_time, :order_value, :description_items)
    end
end
