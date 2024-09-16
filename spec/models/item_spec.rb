require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = Factory.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image, item_name, explain,category_id, condition_id, fee_id, prefecture_id, prepare_idとpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank.")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item_name can't be blank.")
      end
      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank.")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank.")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition_id can't be blank.")
      end
      it 'fee_idが1では登録できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee_id can't be blank.")
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture_id can't be blank.")
      end
      it 'prepare_idが1では登録できない' do
        @item.prepare_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepare_id can't be blank.")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank.")
      end
      it 'priceが300円以下は登録できない' do
        @item.price = Faker::Commerce.price(max_lenggh: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is cheep(minimum is 300yen.)')
      end
      it 'priceがは9,999,999円以上では登録できない' do
        @item.price = Faker::Commerce.price(min_length: 10_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is too expensive(maximum is 9999999 yen.)')
      end
    end
  end
end
