class DropTypePeopleTable < ActiveRecord::Migration
  def change
    def up
      drop_table :types_people
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
