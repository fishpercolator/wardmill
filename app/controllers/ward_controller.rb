class WardController < ApplicationController
  def index
    @wards = Ward.order(:name)
  end
  
  def show
    @ward = Ward.find(params[:id])
  end

end
