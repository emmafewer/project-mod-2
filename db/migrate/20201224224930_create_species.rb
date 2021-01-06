class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.text :name

      t.timestamps
    end
  end
end
