class ChangeColumnToOffer < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :image_url
    add_column :offers, :photo, :string
  end
end
