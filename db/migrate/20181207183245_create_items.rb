class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :rs_id
      t.string :name
      t.boolean :members
      t.integer :shop_price
      t.integer :buy_price
      t.integer :buy_quantity
      t.integer :sell_price
      t.integer :sell_quantity
      t.integer :average_price
      t.integer :overall_quantity
      t.timestamps
    end
  end
end
