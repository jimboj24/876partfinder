class Admin::PartsController < Admin::ApplicationController

  before_action :verify_logged_in
  #before_filter :require_current_user, except: [:search]
  def new
    @page_title ='Manage Parts'
    @part = part.new
  end

  def create
  end

  def archive
    @parts = Part.all.order("created_at DESC").paginate(page: params[:page], per_page:8)
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    @part.update(part_params)
    flash[:notice] = 'Record updated'
  end

  def destroy
   
    if params[:type] == 'normal' 
      @part = Part.find(params[:id])
      @part.destroy
    elsif 
      @part = Part.with_deleted.find(params[:id])
      params[:type] == 'forever'
      @part.really_destroy!
      flash[:notice] = 'Record deleted'
    elsif 
      @part = @part.with_deleted.find(params[:id])
      params[:type] == 'undelete'
      @part.restore(params[:id])
      flash[:notice] = 'Record restored'
    end
    
    redirect_to admin_parts_path
  end


  def index
    @parts = Part.all.order("created_at DESC").paginate(page: params[:page], per_page:8)
  end

  def show
    @part = Part.find(params[:id])
    @parts = Part.all.order("created_at DESC")
  end
   def part_params
    t.text "details"
    params.require(:part).permit(:make, :model, :vin, :year, :part_name, :details, :first_name, :last_name, :email_address, :phone_number, :part_status, :image)
  end
end