class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :inputs
      t.string :outputs
      t.string :owner
      t.string :ri
      t.string :status
      t.string :project
      t.string :discipline
      t.date :need_date

      t.timestamps
    end
  end
end
