class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :teeth
      t.decimal :radius

      t.timestamps
    end
  end
end
