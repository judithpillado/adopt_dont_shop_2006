class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :image
      t.string :current_shelter
      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
