class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = policy_scope(Dog)
    if params[:breed].present?
      @dogs = @dogs.where(breed: params[:breed])
    end
    if params[:size].present?
      @dogs = @dogs.where(size: params[:size])
    end
    if params[:activity].present?
      @dogs = @dogs.where(activity: params[:activity])
    end
    if params[:query].present?
      @dogs = @dogs.search_by_address(params[:query])
    end

    @dogs = @dogs.order(:name).page(params[:page])

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dog: dog }),
        image_url: helpers.asset_url("rufus_logo.png")

      }
    end
  end

  def show
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize @dog

    if @dog.save!
      redirect_to dog_path(@dog), notice: 'Dog was successfully created.'
    else
      render :new
    end

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
    authorize @dog
  end

  def dog_params
    params.require(:dog).permit(:name, :size, :breed, :activity, :description, :address, :age, :photo)
  end
end
