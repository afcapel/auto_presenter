class TasksController < ApplicationController
  before_filter :set_project
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  # POST /tasks
  def create
    @task =  @project.tasks.new(task_params)

    if @task.save
      redirect_to @project, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @project, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :completed_at)
  end
end
