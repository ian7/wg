class CreateFlatmates < ActiveRecord::Migration
  def self.up
    create_table :flatmates do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :flatmates
  end
end
