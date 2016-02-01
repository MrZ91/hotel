class HotelsController < BaseController
  def index
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?

    @hotel = current_user.hotels.build()
    #@hotel.build_adress()
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

    if @hotel.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:title, :room_description, :price_for_room, :breakfast,
                                  { adress_attributes: [:country, :state, :city, :street] })
  end
end
