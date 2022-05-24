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
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
