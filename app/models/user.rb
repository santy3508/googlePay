class User < ApplicationRecord
   has_many :bankaccounts
   has_many :user_id_1, :class_name => "Transaction", :foreign_key =>"user_id_1_id"
   has_many :user_id_2, :class_name => "Transaction", :foreign_key =>"user_id_2_id"
end
