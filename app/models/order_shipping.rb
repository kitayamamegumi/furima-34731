class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city_town, :area_number, :building, :phone_number, :token

  validates :token, presence: true

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows(e.g.123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_town
    validates :area_number
    validates :phone_number, length: { minimum: 10 }, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(zip_code: zip_code, prefecture_id: prefecture_id, city_town: city_town, area_number: area_number,
                    building: building, phone_number: phone_number, order_id: order.id)
  end
end
