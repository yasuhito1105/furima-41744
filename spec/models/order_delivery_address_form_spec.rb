require 'rails_helper'

RSpec.describe OrderDeliveryAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery_address_form = FactoryBot.build(:order_delivery_address_form, user_id: user.id, item_id: item.id)
  end
  describe '住所情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address_form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery_address_form.building_name = ''
        expect(@order_delivery_address_form).to be_valid
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式なら保存できること' do
        @order_delivery_address_form.postal_code = '123-4567'
        expect(@order_delivery_address_form.valid?).to be_truthy
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが無いと保存できない' do
        @order_delivery_address_form.token = nil
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery_address_form.postal_code = ''
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは-がないと保存できないこと' do
        @order_delivery_address_form.postal_code = '1234567'
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'shipping_origin_region_idが1では保存できないこと' do
        @order_delivery_address_form.shipping_origin_region_id = 1
        expect(@order_delivery_address_form.valid?).to be_falsey
      end
      it 'cityが空では保存できないこと' do
        @order_delivery_address_form.city = ''
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @order_delivery_address_form.city = 'abc'
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include('City is invalid. Input full-width characters')
      end
      it 'street_addressが空では保存できないこと' do
        @order_delivery_address_form.street_address = ''
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_delivery_address_form.phone_number = ''
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberの9桁以下では保存できないこと' do
        @order_delivery_address_form.phone_number = '12345678'
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors[:phone_number]).to include("Input only number. is too short. is too long")
      end
      it 'phone_numberの12桁以上では保存できないこと' do
        @order_delivery_address_form.phone_number = '123456789101'
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors[:phone_number]).to include("Input only number. is too short. is too long")
      end
      it 'phone_numberに半角数字以外の文字が入力されると保存できないこと' do
        @order_delivery_address_form.phone_number = '12345abc'
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors[:phone_number]).to include("Input only number. is too short. is too long")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address_form.user_id = nil
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address_form.item_id = nil
        @order_delivery_address_form.valid?
        expect(@order_delivery_address_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
