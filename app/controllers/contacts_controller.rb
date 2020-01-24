class ContactsController < ApplicationController
  #before_action :load_contact, only: [:show, :edit, :update, :destroy]

  #//////////////////////////////////////////// SCOPES ////////////////////////////////////////////////////////////////

  #Initialise scopes using concerns
  ContactsController.new.scope_initialize(ContactsController, Contact)

  #//////////////////////////////////////////// REST API //////////////////////////////////////////////////////////////

  # GET /contacts
  # 10 records per page by default. Set in the model.
  def index
    render :json => apply_scopes(Contact).all
  end

  # GET /contacts/1
  def show
    @contact = load_contact
    render :json => @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render :json => @contact
    else
      render json: :BadRequest, status: 400
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render :json => @contact
    else
      render json: :BadRequest, status: 400
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    render :json => @contacts
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def load_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit!
  end
end
