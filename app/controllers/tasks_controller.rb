class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create task_params
    if @task.save
      redirect_to root_path, notice: "Task: '#{@task.title}' was successfully created."
    else
      config_flash_message :task_errors, @task
    end
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Task: '#{@task.title}' was successfully updated."
    else
      config_flash_message :task_errors, @task
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path notice: "Task: '#{@task.title}' was successfully destroyed."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :id, :list_id)
  end
end
