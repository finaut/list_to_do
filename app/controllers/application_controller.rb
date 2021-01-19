class ApplicationController < ActionController::Base

  protected
  def config_flash_message(name_flash, object)
    flash[name_flash] = Array.new
    if object.errors.any?
      flash[name_flash] << object.errors
      redirect_to root_path
    end
  end
end
