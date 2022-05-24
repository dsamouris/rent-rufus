class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :status, default: true
      t.date :start_date
      t.date :end_date
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
