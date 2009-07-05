class HomeController < ApplicationController
  def index
    if flash[:converted]
      @converted = flash[:converted]
      flash.delete :converted
    end
  end

  # Convert the given string to lower case using the lower-casing service
  def convert
    if request.post?
      if ! params[:input].blank?
        logger.info "Attempting to convert #{params[:input]}"
        flash[:converted] = params[:input].downcase 
      else
        logger.info 'No input supplied?'
        flash[:notice] = 'No String supplied?'
      end
    end
    redirect_to :action => :index
  end
end
