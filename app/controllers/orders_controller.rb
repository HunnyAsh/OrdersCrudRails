# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_order, only: %i[edit destroy show update]
  def index
    @orders = Order.order(:name).page(params[:page]).per(2)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    begin
      if @order.save
        redirect_to orders_path
      else
        render 'new'
      end
    rescue StandardError => exception
      flash[:notice] = exception
      redirect_to(action: 'new')
    end
  end

  def show; end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def edit; end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    else
      render 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :purchased_by, :product_price)
  end

  def find_order
    @order = Order.find_by(id: params[:id])
  end
end
