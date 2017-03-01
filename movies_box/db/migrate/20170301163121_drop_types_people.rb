class DropTypesPeople < ActiveRecord::Migration
  def change
    drop_table :types_people
  end
end
