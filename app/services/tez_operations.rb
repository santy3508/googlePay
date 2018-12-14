require_dependency "all_transactions.rb"
class TezOperations
  def initialize(senderphone,receiverphone,amount)
    @senderId = getIdFromPhone(senderphone)
    @receiverId = getIdFromPhone(receiverphone)
    @amount = amount
  end
  def execute_action 
    return false if (@senderId==nil || @receiverId==nil ||(@senderId == @receiverId) || !checkBalance)
    sender = User.find(@senderId)
    receiver = User.find(@receiverId)
    updateBalance(@receiverId, "+",@amount.to_i)
    updateBalance(@senderId, "-",@amount.to_i)
    transaction = Transaction.new
    transaction.user_id_1_id = @senderId
    transaction.user_id_2_id = @receiverId
    transaction.amount = @amount
    transaction.save
    checkRuleToIssueScratchCard(transaction)
    return transaction
  end

  private 
  def checkBalance
     bankaccount = Bankaccount.where(user_id: @senderId).first
     return false if (bankaccount.balance.to_i - @amount.to_i < 0)
     return true
  end 

  def checkRuleToIssueScratchCard(transaction)
    senderAllTransactions = AllTransactions.new(@senderId).execute_action
    receiverAllTransactions = AllTransactions.new(@receiverId).execute_action
    setScratchCardEntry(@senderId,senderAllTransactions,transaction)
    setScratchCardEntry(@receiverId,receiverAllTransactions,transaction)
  end

  def setScratchCardEntry(user_id, allTransactions,transaction)
    rule = Rule.where(period: "yearly").all 
    byebug
    if(checkLimit(allTransactions))
      scratch_amt = rand(0..rule[0].maxscratch)
      updateBalance(user_id,"+",scratch_amt) 
      scratchcard = Scratchcard.new
      scratchcard.user_id = user_id
      scratchcard.transaction_id = transaction.id
      scratchcard.amount = scratch_amt
      scratchcard.save
    end
  end

  def checkLimit(allTransactions)
    ruleYear = Rule.where(period: "yearly").all 
    return false if (ruleYear[0].limit <= (allTransactions.group_by { |m| m.created_at.year }[Date.current.year].count)) 
    ruleMonth = Rule.where(period: "monthly").all 
    return false if (ruleMonth[0].limit <= (allTransactions.group_by { |m| m.created_at.month }[Date.current.month].count)) 
    ruleDaily = Rule.where(period: "daily").all 
    return false if (ruleDaily[0].limit <= (allTransactions.group_by { |m| m.created_at.day }[Date.current.day].count)) 
    return false if(ruleDaily[0].minrange > @amount.to_i && ruleDaily[0].maxrange < @amount.to_i)
    return true
  end

  def getIdFromPhone(phoneno)
     user = User.where(phone: phoneno).first
     return user.id if user!= nil
     return nil
  end

  def updateBalance(user_id,operation, amount)
    bankAccount = Bankaccount.where(user_id: user_id).first
    if(operation == "-")
      bankAccount.balance = (bankAccount.balance.to_i - amount).to_s    
    elsif(operation == "+" and amount!=0) 
      bankAccount.balance = (bankAccount.balance.to_i + amount).to_s
    end
    bankAccount.save
  end
  
end