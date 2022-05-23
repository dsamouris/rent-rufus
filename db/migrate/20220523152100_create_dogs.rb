class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :size
      t.string :breed
      t.string :activity
      t.text :description
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
