class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @rdog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog

    if @dog.save
      redirect_to @rdog, notice: 'Dog was successfully created.'
    else
      render :new
    end
  end

  def show
    set_dog
    authorize @dog
  end

  def update
    @dog.update(dog_params)
    redirect_to dog_path(@dog), notice: 'Dog was successfully updated.'
    authorize @dog
  end

  def edit
    set_dog
    authorize @dog
  end

  def destroy
    set_dog
    @dog.destroy
    redirect_to dogs_path, notice: 'Dog was successfully deleted.'
    authorize @dog
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :breed, :activity, :description, :age)
  end
end
