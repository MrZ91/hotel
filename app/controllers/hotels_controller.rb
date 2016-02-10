class HotelsController < BaseController
  before_filter :find_hotel, only: [:show, :rate]
  skip_before_filter :authenticate_user!, only: [:show]

  def new
    redirect_to new_user_session_path unless user_signed_in?

    @hotel = current_user.hotels.build()
    #@hotel.build_adress()
  end

  def create
    @hotel = current_user.hotels.build(hotel_params)

    if @hotel.save
      redirect_to user_hotel_path(@hotel)
    else
      render 'new'
    end
  end

  def rate
    rating = @hotel.raitings.build(user: current_user, value: params[:raiting][:value])
    if rating.save
      redirect_to hotel_path(@hotel)
    else
      flash[:alert]="Something goes wrong! Your rate was not saved!"
      redirect_to hotel_path(@hotel)
    end
  end

  private
  def find_hotel
    @hotel ||= Hotel.find_by(id: params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:title, :room_description, :price_for_room, :breakfast,
                                  {pictures: []},
                                  { adress_attributes: [:country, :state, :city, :street] })
  end
end
