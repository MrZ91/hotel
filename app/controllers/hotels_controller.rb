class HotelsController < BaseController
  def show
    @hotel=Hotel.find_by(id: params.require(:id))
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?

    @hotel = current_user.hotels.build()
    #@hotel.build_adress()
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def rate
    current_user.rate_hotel_by_value!(Hotel.find_by(id: params.require(:id)),
                                     params[:raitings])
    redirect_to show
  end

  private

  def hotel_params
    params.require(:hotel).permit(:title, :room_description, :price_for_room, :breakfast,
                                  {pictures: []},
                                  { adress_attributes: [:country, :state, :city, :street] })
  end
end
