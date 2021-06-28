class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :zip_code,         null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city_town,        null: false
      t.string     :area_number,      null: false
      t.string     :building
      t.string     :phone_number,     null: false
      t.references :order,            null: false, foreige_kye: true
      t.timestamps
    end
  end
end
