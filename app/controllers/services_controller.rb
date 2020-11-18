class ServicesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(recipe_params)
    @service.save
    redirect_to recipe_path(@recipe)
  end

  private
  def recipe_params
    params.require(:service).permit(:company, :device, :problem, :price, :days, :result, :body, :image)
  end
end
