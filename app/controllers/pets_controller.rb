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
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to pets_path
    else
      render :edit
    end
  end

  def destroy
    Pet.find(params[:id]).destroy
    redirect_to pets_path
  end

    private
 
    def pet_params
      params.require(:pet).permit(:name, :animal_type, :age, :color)
    end
end
