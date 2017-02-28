class TablePersons < ActiveRecord::Migration
  def change
    create_table :persons
    add_column :persons, :name, :string
  end
end
