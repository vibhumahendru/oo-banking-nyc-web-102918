require "pry"

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    answer = false
    if self.sender.valid? && self.receiver.valid?
      return true
    end
    answer
  end

  def execute_transaction
    if self.status == "complete" || self.status == "rejected"
      return nil
    end
    if self.sender.valid? && self.sender.balance> self.amount
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
    
  end




end
