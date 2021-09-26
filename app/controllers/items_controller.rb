class ItemsController < ApplicationController
  
  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
  
private

  def item_params
    params.require(:item).permit(:name, :image, :caption)
  end
  
end
