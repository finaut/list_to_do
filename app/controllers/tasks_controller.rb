class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create task_params

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: "Task: '#{@task.title}' was successfully created." }
      else
        format.html { redirect_to root_path, notice: 'Task created error.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to root_path, notice: "Task: '#{@task.title}' was successfully updated." }
      else
        format.html { redirect_to root_path, notice: "Task update error." }
      end
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
      params.require(:task).permit(:complete, :title, :list_id)
    end
end
