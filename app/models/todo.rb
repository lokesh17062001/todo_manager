class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[ x ]" : "[]"
    "#{id}. #{date_submission.to_s(:long)} #{todo_text} #{is_completed}"
  end
end
