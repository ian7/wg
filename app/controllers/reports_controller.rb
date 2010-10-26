class ReportsController < ApplicationController
  def summary
    @spendings = []
    User.all.each do |u|
        key={}
        key[:name]=u.name
        key[:spendings]=0
        key[:consumes]=0
        
      Expense.all.each  do |e|
        
        if e.person == u.name
          key[:spendings] = key[:spendings] + e.value
        end
        
        if e.shareholders.include?(u.name)
          key[:consumes] = key[:consumes] + e.value_per_head
        end
        
      end
    @spendings << key
    end
  end

end
