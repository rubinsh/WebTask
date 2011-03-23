module TasksHelper
  def toggle_complete_text(task)
    if task.completed?
      "Mark not complete"
    else
      "Mark complete"
    end
  end

  def check_that_task_belongs_to_user

  end

  def self.try_get_task(current_user ,task_id)
    begin
      return current_user.tasks.find(task_id)
    rescue ActiveRecord::RecordNotFound
      return nil
    end
  end

end
