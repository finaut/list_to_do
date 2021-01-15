class ListsController < ApplicationController
  before_action :set_list, only: [:update, :destroy, :set_capitalize]

  def index
    @lists = List.all
    @list = List.new
    @tasks = @list.tasks.build

  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: "List: '#{@list.name}' was successfully created." }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_path, notice: "List: '#{@list.name}' was successfully updated." }
      else
        format.html { redirect_to root_path }
      end
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
    params.require(:list).permit(:name.capitalize, :id)
  end
end
