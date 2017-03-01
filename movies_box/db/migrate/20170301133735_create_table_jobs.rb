class CreateTableJobs < ActiveRecord::Migration
  def change
    create_table :jobs
    add_column :jobs, :name, :string
  end
end
