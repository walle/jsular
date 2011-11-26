class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.string :permalink
      t.string :expression
      t.string :modifiers
      t.string :testdata

      t.timestamps
    end
  end
end
