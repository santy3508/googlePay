class Transaction < ApplicationRecord
  belongs_to :user_id_1, :class_name => "User"
  belongs_to :user_id_2, :class_name => "User"
end
