class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :set_donor, only: [:create, :edit]
  before_action :set_organization, only: [:create, :edit]

  def index
    @donations = Donation.take(10)
  end

  def new
    @donation = Donation.new
    @donors = Donor.all
    @organizations = Organization.all
  end

  def edit
    @donation = Donation.find(params[:id])
    @donors = Donor.all
    @organizations = Organization.all
  end

  def show
    @organization = @donation.donor
    @donor = @donation.donor
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:notice] = 'Donation added!'
      redirect_to @donation
    else
      flash[:notice] = "Donation could not be saved"
      render :new
    end
  end

  def update
    if @donation.update(donation_params)
      flash[:notice] = "Donation updated!"
      redirect_to @donation
    else
      flash[:notice] = "Donation could not be updated"
      render :edit
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_path, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_organization
    @organization = Organization.find_by(params[:organization_id])
  end

  def set_donor
    @donor = Donor.find_by(params[:donor_id])
  end

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:amount, :date, :organization_id, :donor_id)
  end
end
