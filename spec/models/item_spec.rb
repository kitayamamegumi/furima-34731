require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('public/image/test_image.png')
  end

  describe '出品の保存' do
    context '出品ができる場合' do
      it '全ての値が正しく入力がある場合、出品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it '画像がないと保存出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないとitemは保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it ' 説明がないとitemは保存出来ない' do
        @item.discribe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discribe can't be blank")
      end
      it 'カテゴリーがないとitemは保存出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが1だとitemは保存出来ない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品状態がないとitemは保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品状態が1だとitemは保存出来ない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it '配送負担がないとitemは保存できない' do
        @item.delivery_pay_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery pay can't be blank")
      end
      it '配送負担が1だとitemは保存出来ない' do
        @item.delivery_pay_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery pay Select')
      end
      it '地域がないとitemは保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '地域が1だとitemは保存出来ない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '配送日までの日数がないとitemは保存できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '配送日が1だとitemは保存出来ない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end
      it '価格がないとitemは保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '価格が全角だとitemは保存できない' do
        @item.selling_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end
      it '価格が半角英語だとitemは保存できない' do
        @item.selling_price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end
      it '価格が半角英数字混合だとitemは保存できない' do
        @item.selling_price = '1a2b3'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end
      it '価格が300円以下だとitemは保存できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end
      it '価格が9,999,999円以上だとitemは保存できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end
      it 'ユーザーが紐付いていないとitemは保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
