class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :category
      t.integer :rate
      t.string :comment
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
