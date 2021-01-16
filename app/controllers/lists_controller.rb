class ListsController < ApplicationController
  before_action :set_list, only: [:update, :destroy]

  def index
    @lists = List.all
    @list = List.new
    @tasks = @list.tasks.build

  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: "List: '#{@list.name}' was successfully created."
    else
      config_flash_message :list_errors, @list
    end
  end

  def update
    if @list.update(list_params)
      redirect_to root_path, notice: "List: '#{@list.name}' was successfully updated."
    else
      config_flash_message :list_errors, @list

    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "List: '#{@list.name}' was successfully destroyed." }
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :id)
  end
end
