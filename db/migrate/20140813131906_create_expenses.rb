class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :expense_dt, null: false
      t.decimal :amount, null: false
      # storing amount as decimal, not integer cents
      t.string :description, limit: 500, null: false
      t.string :comment, limit: 1000
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end

# validate dup expenses?
