class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def edit
    @donation = Donation.find(params[:id])
    @donors = Donor.all
    @organizations = Organization.all
  end

  def show
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      flash[:success] = 'Donation added!'
      redirect_to @donation
    else
      flash[:notice] = "Donation could not be saved"
      render :new
    end
  end

  def update
    if @donation.update(donation_params)
      flash[:success] = "Donation updated!"
      redirect_to @donation
    else
      flash[:notice] = "Donation could not be updated"
      render :edit
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:amount, :date, :organization_id, :donor_id)
  end
end
