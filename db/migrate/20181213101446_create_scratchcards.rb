class CreateScratchcards < ActiveRecord::Migration[5.2]
  def change
    create_table :scratchcards do |t|
      t.string :user_id
      t.integer :amount
      t.belongs_to :transaction, index: true
      t.timestamps
    end
  end
end
