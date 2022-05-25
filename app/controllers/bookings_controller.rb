class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    set_booking
    authorize @booking
  end

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dog = Dog.find(params[:dog_id])
    @booking.user = current_user
    if @booking.save!
      redirect_to user_booking_path(current_user, @booking), notice: "You've booked your doggo friend!"
    else
      render :new
    end
    authorize @booking
  end

  # def edit
  #   set_booking
  #   @booking = Booking.find(params[:id])
  #   # authorize @booking
  # end

  # def update
  #   set_booking
  #   if @booking.update(booking_params)
  #     redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
  #   else
  #     render :edit
  #   end
  #   # authorize @booking
  # end

  def destroy
    set_booking
    @booking.destroy
    redirect_to dogs_path, notice: 'Booking was successfully deleted.'
    authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
