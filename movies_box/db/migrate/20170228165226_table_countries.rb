class TableCountries < ActiveRecord::Migration
  def change
    create_table :countries
    add_column :countries, :name, :string
    add_column :countries, :name_long, :string
  end
end
