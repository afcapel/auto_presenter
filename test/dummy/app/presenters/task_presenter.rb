class TaskPresenter < DelegateClass(Task)

  def status
    completed_at.present? ? 'Completed' : 'Uncompleted'
  end
end
