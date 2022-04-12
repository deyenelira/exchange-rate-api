class CreateHistorics < ActiveRecord::Migration[6.0]
  def change
    create_table :historics do |t|
      t.boolean :success
      t.numeric :timestamp
      t.boolean :historical
      t.string :base
      t.string :date
      t.json :rates

      t.timestamps
    end
  end
end
