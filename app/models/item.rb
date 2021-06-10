class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_pay
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image,            presence: true
  validates :name,             presence: true
  validates :discribe,         presence: true

  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :delivery_pay_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :selling_price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: '半角数字を使用してください' },
                              inclusion: { in: (300..9_999_999) }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :delivery_pay_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image
end
