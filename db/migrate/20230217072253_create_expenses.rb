class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.references :source, null: false, foreign_key: true
      t.integer :source_location

      t.timestamps
    end
  end
end
