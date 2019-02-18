# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
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
end
