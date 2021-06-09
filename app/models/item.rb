class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_pay, :prefecture, :delivery_day

  validates :image,            presence: true
  validates :name,             presence: true
  validates :discribe,         presence: true
  
  with_options presence: true do
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_pay_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :selling_price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: '半角数字を使用してください' }, inclusion: { in: (300..9999999)}
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

end
