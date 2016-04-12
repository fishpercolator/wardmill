class DatasetController < ApplicationController
  def index
    @datasets = Dataset.order(:title)
  end

  def show
    @dataset = Dataset.find(params[:id])
  end
end
