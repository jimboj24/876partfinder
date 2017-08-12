class ContactsController < ApplicationController
  def new
  	@page_title = 'Contact us'
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:notice] = "Contact successfully submitted"
  		redirect_to contact_path
  	else
  		render 'new'
  	end
  end
  def contact_params
  	params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end