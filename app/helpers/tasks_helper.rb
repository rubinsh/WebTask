module TasksHelper
  def toggle_complete_text(task)
    if task.completed?
      "Mark not complete"
    else
      "Mark complete"
    end
  end
end
