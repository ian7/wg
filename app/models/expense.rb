class Expense < ActiveRecord::Base
  serialize :shareholders
  
  def save
    shareholders.delete("")
    super
  end

  def value_per_head
    return value / shareholders.size
  end  
end
