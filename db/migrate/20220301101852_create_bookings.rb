class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|

      t.timestamps
      t.datetime :date
      t.references :offer, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
