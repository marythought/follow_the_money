class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:success] = 'Organization added!'
      redirect_to @organization
    else
      flash[:notice] = "Organization could not be saved"
      render :new
    end
  end

  def update
    if @organization.update(organization_params)
      flash[:success] = "Organization updated!"
      redirect_to @organization
    else
      flash[:notice] = "Organization could not be updated"
      render :edit
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_path, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
