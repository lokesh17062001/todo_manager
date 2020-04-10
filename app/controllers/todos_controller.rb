class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:date_submission).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    date_submission = DateTime.parse(params[:date_submission])
    new_todo = Todo.create!(
      todo_text: todo_text,
      date_submission: date_submission,
      completed: false,
    )
    response_text = "created new todo with id #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed to #{completed}"
  end
end
