class AddIndices < ActiveRecord::Migration
  def up
    add_index :tasks, :owner
    add_index :tasks, :ri
    add_index :tasks, :discipline
  end

  def down
    remove_index :tasks, :owner
    remove_index :tasks, :ri
    remove_index :tasks, :discipline
  end
end
