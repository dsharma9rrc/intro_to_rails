class BreedsController < ApplicationController
  def index
    if params[:search].present?
      @breeds = Breed.where("name LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @breeds = Breed.page(params[:page]).per(10)
    end 
  end

  def show
    @breed = Breed.includes(:user, :sub_breeds).find(params[:id])
  end
end

