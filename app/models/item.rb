class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_pay, :prefecture, :delivery_day

  validates :image,            presence: true
  validates :name,             presence: true
  validates :discribe,         presence: true
  
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_pay_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :delivery_pay_id,  presence: true
  validates :prefecture_id,    presence: true
  validates :delivery_day_id,  presence: true
  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: '半角数字を使用してください' } do
    validates :selling_price,  presence: true
    validates :selling_price, inclusion: { in: (300..9999999)}
  end
end
