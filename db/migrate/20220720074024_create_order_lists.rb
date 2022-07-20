class CreateOrderLists < ActiveRecord::Migration[6.1]
  def change
    create_table :order_lists do |t|
      t.references :service, null: false, foreign_key: true
      t.references :specialist, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
