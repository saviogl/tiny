class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :tinyfied
      t.string :original
      t.integer :clicks, default: 0

      t.timestamps null: false
    end
    add_index :links, :tinyfied
  end
end
