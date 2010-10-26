class Expense < ActiveRecord::Base
  serialize :shareholders
  
  def save
    shareholders.delete("")
    super
  end
end
