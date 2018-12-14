class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :period
      t.integer :limit
      t.integer :minrange
      t.integer :maxrange
      t.string :transactiontype
      t.integer :maxscratch

      t.timestamps
    end
  end
end
