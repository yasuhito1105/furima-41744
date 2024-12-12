require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '出品できるとき' do
      it 'imageとproduct_nameとproduct_descriptionとcategory_idとproduct_condition_idとshipping_fee_idとshipping_origin_region_idとdelivery_day_idとprice(300円から9_999_999円)が存在してるとき' do
        expect(@item).to be_valid
      end
      it '価格が300円以上9,999,999円以下であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'product_nameが空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが空では出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_condition_idが1では出品できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'shipping_fee_idが1では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_origin_region_idが1では出品できない' do
        @item.shipping_origin_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin region can't be blank")
      end
      it 'delivery_day_idが1では出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数値では登録できない' do
        @item.price = '８００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが1000万以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが整数でないと登録できない' do
        @item.price = 1000.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
