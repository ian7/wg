class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string :date
      t.string :person
      t.string :name
      t.string :shareholders
      t.string :value
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
