class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :discribe,         null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :delivery_pay_id,  null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :delivery_day_id,  null: false
      t.integer    :selling_price,    null: false
      t.references :user,             foreige_kye: true
      t.timestamps
    end
  end
end
