class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]

  def index
    @donors = Donor.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @donor = Donor.new
  end

  def edit
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      flash[:success] = 'Donor added!'
      # redirect_to @donor
    else
      flash[:notice] = "Donor could not be saved"
      render :new
    end
  end

  def update
    if @donor.update(donor_params)
      flash[:success] = "Donor updated!"
      # redirect_to @donor
    else
      flash[:notice] = "Donor could not be updated"
      render :edit
    end
  end

  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_path, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_donor
    @donor = Donor.find(params[:id])
  end

  def donor_params
    params.require(:donor).permit(:name)
  end
end
