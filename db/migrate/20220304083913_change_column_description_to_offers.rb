class ChangeColumnDescriptionToOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :description
    add_column :offers, :description, :text
  end
end
