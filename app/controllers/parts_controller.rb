class PartsController < ApplicationController
  def new
  	@page_title = 'Parts Request'
  	@part = Part.new
  end

  def create
  	@part = Part.new(part_params)
  	if @part.save
  		flash[:notice] = "Request successfully submitted"
  		#redirect_to parts_path
      render 'show'
  	else
  		render 'new'
  	end
  end

  def index

  end

  def show
  	@part = Part.find(params[:id])
  	@parts = Part.all
  end

  def part_params
  	params.require(:part).permit(:make, :model, :vin, :year, :part_name, :details, :first_name, :last_name, :email_address, :phone_number, :part_status, :image)
  end
end



#def contact_params
#    params.require(:contact).permit(:first_name, :last_name, :email, :message)
#  end