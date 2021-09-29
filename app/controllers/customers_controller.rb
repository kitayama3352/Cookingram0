class CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :ensure_correct_user,only: [:edit,:update,:destory]


  def show
    @customer = Customer.find(params[:id])
    @items = @customer.items.reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def ensure_correct_user
   @customer = Customer.find(params[:id])
    unless @customer == current_customer
    redirect_to items_path
    end
  end


private

  def customer_params
    params.require(:customer).permit(:name, :profile_image,:introduction)
  end

end
