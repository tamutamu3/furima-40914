class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:item).permit(:item_name, :explain, :category_id, :condition_id, :fee_id, :prefecture_id, :prepare_id, :price)
  end
end
