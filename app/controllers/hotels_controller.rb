class HotelsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def index

  end

  def new
     if !signed_in?
       redirect_to signin_url
    else
      @user = current_user
      @hotel = current_user.hotels.build()
      @hotel.build_adress()
     end
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
