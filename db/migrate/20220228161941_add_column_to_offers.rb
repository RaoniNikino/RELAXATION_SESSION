class AddColumnToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :description, :string
  end
end
