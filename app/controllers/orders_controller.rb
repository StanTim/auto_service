class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
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

  def export_to_xlsx(orders)
    orders.order(created_at: :desc).each do |order|
      "order_#{order.id}.xlsx"
      render_to_string(layout: false, headlers: [:axlsx],
                             formats: [:xlsx],
                             template: 'orders/order',
                             locals: { order: order })
    end

    # rewind
    # send_data read, filename: 'orders.xlsx'
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:id,
                                  :car,
                                  :phone,
                                  :client_name,
                                  order_lists_attributes: [:id,
                                                           :order_id,
                                                           :service_id,
                                                           :specialist_id])
  end
end
