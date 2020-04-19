class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[ x ]" : "[]"
    "#{id}. #{date_submission.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.overdue
    all.where("date_submission<?", Date.today)
  end
  def self.due_today
    all.where("date_submission=?", Date.today)
  end
  def self.due_later
    all.where("date_submission>?", Date.today)
  end
  def self.completed
    all.where("completed=?", true)
  end

  def self.notcompleted
    all.where("completed=?", false)
  end
end
