class PetsController < ApplicationController

  def index
    # TODO: set up data for index view
    owner_id = params[:owner_id]
    @owner = Owner.find_by(id: owner_id)
    # @pets = @owner.pets

  end

  def show
    # TODO: set up data for show view

    @pet = Pet.find_by(id: params[:id])
  end

  def new
    @pet = Pet.new
    # owner_id = params[:owner_id]
    # @owner = Owner.find_by (id: owner_id)
  end

  def create
  owner = Owner.find(params[:owner_id])
  new_pet = Pet.new(pet_params)
    if new_pet.save
      owner.pets << new_pet
      redirect_to owner_pets_path(owner, new_pet)
    else
      flash[:error] = new.pet.errors.full_messages.join(", ")
      redirect_to new_owner_pet_path(owner)
    end
  end

  # TODO: handle save errors and communicate issues to user

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
