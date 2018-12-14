class AddPhoneToUser < ActiveRecord::Migration[5.2]
  def change
  	add_index :user, :phone 
  end
end
