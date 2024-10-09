class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item
  before_action :set_purchasesddress, only: [:index, :new]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    redirect_to root_path unless item.purchase.blank?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purchasesddress
    @purchase_address = PurchaseAddress.new
  end

  def purchase_params
    params.require(:purchase_address)
          .permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :price)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token], item_price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:item_price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
