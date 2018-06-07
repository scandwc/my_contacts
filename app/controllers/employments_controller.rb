class EmploymentsController < ApplicationController
  def index
    @employments = Employment.all

    render("employments/index.html.erb")
  end

  def show
    @employment = Employment.find(params[:id])

    render("employments/show.html.erb")
  end

  def new
    @employment = Employment.new

    render("employments/new.html.erb")
  end

  def create
    @employment = Employment.new

    @employment.company_id = params[:company_id]
    @employment.contact_id = params[:contact_id]

    save_status = @employment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/employments/new", "/create_employment"
        redirect_to("/employments")
      else
        redirect_back(:fallback_location => "/", :notice => "Employment created successfully.")
      end
    else
      render("employments/new.html.erb")
    end
  end

  def edit
    @employment = Employment.find(params[:id])

    render("employments/edit.html.erb")
  end

  def update
    @employment = Employment.find(params[:id])

    @employment.company_id = params[:company_id]
    @employment.contact_id = params[:contact_id]

    save_status = @employment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/employments/#{@employment.id}/edit", "/update_employment"
        redirect_to("/employments/#{@employment.id}", :notice => "Employment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Employment updated successfully.")
      end
    else
      render("employments/edit.html.erb")
    end
  end

  def destroy
    @employment = Employment.find(params[:id])

    @employment.destroy

    if URI(request.referer).path == "/employments/#{@employment.id}"
      redirect_to("/", :notice => "Employment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Employment deleted.")
    end
  end
end
