class ContactsController < ApplicationController
  before_action :current_user_must_be_contact_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_contact_user
    contact = Contact.find(params[:id])

    unless current_user == contact.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @contacts = Contact.all

    render("contacts/index.html.erb")
  end

  def show
    @contact = Contact.find(params[:id])

    render("contacts/show.html.erb")
  end

  def new
    @contact = Contact.new

    render("contacts/new.html.erb")
  end

  def create
    @contact = Contact.new

    @contact.name = params[:name]
    @contact.position = params[:position]
    @contact.linkedin = params[:linkedin]
    @contact.last_connected_date = params[:last_connected_date]
    @contact.email = params[:email]
    @contact.category_id = params[:category_id]
    @contact.user_id = params[:user_id]

    save_status = @contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contacts/new", "/create_contact"
        redirect_to("/contacts")
      else
        redirect_back(:fallback_location => "/", :notice => "Contact created successfully.")
      end
    else
      render("contacts/new.html.erb")
    end
  end

  def edit
    @contact = Contact.find(params[:id])

    render("contacts/edit.html.erb")
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.name = params[:name]
    @contact.position = params[:position]
    @contact.linkedin = params[:linkedin]
    @contact.last_connected_date = params[:last_connected_date]
    @contact.email = params[:email]
    @contact.category_id = params[:category_id]
    @contact.user_id = params[:user_id]

    save_status = @contact.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/contacts/#{@contact.id}/edit", "/update_contact"
        redirect_to("/contacts/#{@contact.id}", :notice => "Contact updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Contact updated successfully.")
      end
    else
      render("contacts/edit.html.erb")
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    if URI(request.referer).path == "/contacts/#{@contact.id}"
      redirect_to("/", :notice => "Contact deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Contact deleted.")
    end
  end
end
