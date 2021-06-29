require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id)
    end
    before do
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空だと保存できないこと' do
        @order_shipping.zip_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.zip_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Zip code is invalid. Enter it as follows(e.g.123-4567)')
      end
      it '地域がないとitemは保存できない' do
        @order_shipping.prefecture_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '地域が1だとitemは保存出来ない' do
        @order_shipping.prefecture_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'area_numberが空だと保存できないこと' do
        @order_shipping.area_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Area number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上でないと保存できないこと' do
        @order_shipping.phone_number = '090000000'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_shipping.phone_number = '090000000000'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_shipping.phone_number = '０９０００００００'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが英数混合だと保存できないこと' do
        @order_shipping.phone_number = 'a9000aaaaaa'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐ついてないと保存できないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついていないと保存出来ないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
end
