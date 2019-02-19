# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :find_order, only: %i[edit destroy show update]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    redirect_to orders_path
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
    params.require(:order).permit(user: [:name, :purchased_by, :product_price])
  end

  def find_order
    @order = Order.find_by(id: params[:id])
  end
end
