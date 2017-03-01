class TablePeople < ActiveRecord::Migration
  def change
    create_table :people
    add_column :people, :name, :string
  end
end
