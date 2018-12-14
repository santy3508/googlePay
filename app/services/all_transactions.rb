class AllTransactions
  
  def initialize(userid)
    @userId = userid
  end
  def execute_action
     return allTransactions
  end
  private
  def sendTransactions
     sendTransactions = Transaction.where(user_id_1_id: @userId).all
     return sendTransactions
  end
  def receiveTransactions
    receiveTransactions = Transaction.where(user_id_2_id: @userId).all
    return receiveTransactions
  end
  def allTransactions
  	allTransaction = sendTransactions + receiveTransactions
    transactions = Transaction.find(allTransaction.map(&:id))
  	return transactions
  end
end