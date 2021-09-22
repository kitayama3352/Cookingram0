class ItemsController < ApplicationController
  
  def new
     @item = Item.new
  end

  def create
    @item = Item.new(post_image_params)
    @item.customer_id = current_customer.id
    
    if @item.save
      redirect_to items_path
    else
      render :new
    end
    
  end

  def index
     @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
  
private

  def post_image_params
    params.require(:item).permit(:name, :image, :caption)
  end
  
end
