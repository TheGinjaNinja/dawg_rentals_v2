class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :available_from
      t.datetime :available_until
      t.integer :price
      t.boolean :status
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
