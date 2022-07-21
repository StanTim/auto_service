class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.order_lists.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    # @order_list = @order.order_lists.create(order_list_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: "Order was successfully created." }
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
        format.html { redirect_to order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # def set_order_lists
  #   @order_lists = @order.order_lists
  # end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:client_name,
                                  :phone,
                                  :car,
                                  order_lists_attributes: [:order_id,
                                                           :service_id,
                                                           :specialist_id] )
  end

  # def order_list_params
  #   params.require(:order).permit(:order_id, :service_id, :specialist_id)
  # end
end
