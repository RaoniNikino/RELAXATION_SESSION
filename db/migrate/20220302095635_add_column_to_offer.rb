class AddColumnToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :address, :string
    add_column :offers, :latitude, :float
    add_column :offers, :longitude, :float
    add_column :offers, :image_url, :string
  end
end
