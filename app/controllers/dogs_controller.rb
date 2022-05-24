class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    # @dogs = policy_scope(Dog)
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    # authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    # authorize @dog

    if @dog.save!
      redirect_to dog_path(@dog), notice: 'Dog was successfully created.'
    else
      render :new
    end

  end

  def show
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog), notice: 'Dog was successfully updated.'
  end

  def edit

  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, notice: 'Dog was successfully deleted.'
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
    # authorize @dog
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :breed, :activity, :description, :age)
  end
end
