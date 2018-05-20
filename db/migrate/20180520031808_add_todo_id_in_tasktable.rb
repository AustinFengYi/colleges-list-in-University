class AddTodoIdInTasktable < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :todo_id, :integer
  end
end
