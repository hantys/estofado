# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update change_status_order destroy]

  # GET /orders
  # GET /orders.json
  def index
    @q = Order.ransack(params[:q])
    @orders = if params[:debito] == 'true'
                @q.result.where(status: 1).order(id: :desc).page params[:page]
              else
                @q.result.order(id: :desc).page params[:page]
              end
  end

  # { in_production: 0, pending: 1, delivered: 2, ok: 3, paid: 4 }
  def change_status_order
    case params[:status]
    when 'entregue'
      @order.update status: 2, payday: (Date.today + 30.days)
    when 'finalizar'
      @order.update status: 4
    end
    flash[:success] = 'Situação alterada!'
    redirect_back(fallback_location: root_path)
  rescue StandardError
    flash[:error] = 'Algum problema ocorreu, tente novamente!'
    redirect_back(fallback_location: root_path)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if params[:modal] == 'true'
      @modal = true
      render :show, layout: false
    end
  end

  # GET /orders/new
  def new
    @client_id = params[:client_id] || nil
    @order = Order.new
    @order.payments.build
  end

  # GET /orders/1/edit
  def edit
    @client_id = @order.client_id
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @client_id = @order.client_id
    @order.cost = convert_money(order_params[:cost])
    @order.payments.last.value = convert_money(order_params[:payments_attributes].values[0][:value])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      order_params[:cost] = convert_money(order_params[:cost])
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        @client_id = @order.client_id
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def convert_money(money)
    money
      .delete('.')
      .delete('R$')
      .tr(',', '.')
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit!
  end
end
