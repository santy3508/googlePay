class CreateBankaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bankaccounts do |t|
      t.string :acc_no
      t.string :ifsc
      t.string :balance
      t.string :bank
			t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
