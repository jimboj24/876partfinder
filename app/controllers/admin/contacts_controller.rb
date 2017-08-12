class Admin::ContactsController < Admin::ApplicationController
  before_action :verify_logged_in
  def new
    @page_title = 'Add New Contact'
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact Created"
      redirect_to admin_contacts_path
    else
      render 'new'
    end
  end

  def update
    @contact  = Contact.find(params[:id])
    @contact.update(contact_params)

    flash[:notice] = 'Contact Updated'

    redirect_to admin_contacts_path
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = 'Contact Deleted'
    redirect_to admin_contacts_path
  end
  def index
    @contacts = Contact.all.order("created_at DESC").paginate(page: params[:page], per_page:2)
  end

  def show
    @contact = Contact.find(params[:id])
    @contacts = Contact.all.order("created_at DESC")
  end

  

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
