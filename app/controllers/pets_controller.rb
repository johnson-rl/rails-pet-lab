class PetsController < ApplicationController

  def index
    # TODO: set up data for index view
    @owner = Owner.find_by(id: params[:owner_id])
  end

  def show
    # TODO: set up data for show view
    @pet = Pet.find_by(id: params[:id])
  end

  def new
  # TODO: set up *new* method with data for new view
    @pet = Pet.new
    # @owner = Owner.find_by(id: params[:owner_id])
  end

  def create
  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user
    pet = Pet.create(pet_params)
    owner = Owner.find_by(id: params[:owner_id])
    owner.pets << pet
    redirect_to pet_path(pet)
  end
  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
