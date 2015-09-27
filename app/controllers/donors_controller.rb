class DonorsController < ApplicationController
 before_action :set_donor, only: [:show, :edit, :update, :destroy]

  def index
    @donors = Donor.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_donor
    @donor = Donor.find(params[:id])
  end

  def donor_params
    params.require(:donor).permit(:name)
  end
end
