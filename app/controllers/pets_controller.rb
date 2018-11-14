class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
 
    if @pet.save
      redirect_to pet_path
    else
      render :new
    end
  end
 
  private
 
    def pages_params
      params.require(:pet).permit(:name, :animal_type, :age, :color)
    end
end
