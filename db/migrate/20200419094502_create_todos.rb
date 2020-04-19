class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.text :todo_text
      t.date :date_submission
      t.boolean :completed
    end
  end
end
