class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user_id_1
      t.references :user_id_2
      t.string :amount

      t.timestamps
    end
  end
end
