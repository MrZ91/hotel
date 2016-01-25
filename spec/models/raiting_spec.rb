require 'rails_helper'

describe "Raiting model" do
 before { @raiting=Raiting.new}
  subject{@raiting}

  it{should respond_to(:user_id)}
  it{should respond_to(:hotel_id)}
  it{should respond_to(:value)}

  describe "with invalid value" do
    before{@raiting.value=0}
    it {should be_invalid}
    before{@raiting.value=0.1}
    it {should be_invalid}
    before{@raiting.value=-1}
    it {should be_invalid}
    before{@raiting.value=6}
    it {should be_invalid}
  end

  describe "with valid value" do
    before{@raiting.value=3}
    it {should be_valid}
  end

  describe "rates " do
    before do
      @first_user=User.new(name: "First User", email: "first@mail.com",
                          password:"123123", password_confirmation: "123123")
      @second_user=User.new(name: "Seecond User", email: "second@mail.com",
                           password:"123123", password_confirmation: "123123")
      @first_user.save
      @second_user.save

      @fst_hotel=@first_user.hotels.build(title:"First Hotel",
                                        room_description:"Best roomz EVA!",
                                        price_for_room:12.1, breakfast: true,
                                        :adress_attributes=>{country:"First country",
                                                             state:"First state",
                                                             city:"First City",
                                                             street:"First street"})
      @scd_hotel=@first_user.hotels.build(title:"Second Hotel",
                                        room_description:"Best roomz EVA!",
                                        price_for_room:12.1, breakfast: true,
                                        :adress_attributes=>{country:"Second country",
                                                             state:"Second state",
                                                             city:"Second City",
                                                             street:"Second street"})
      @trd_hotel=@second_user.hotels.build(title:"Third Hotel",
                                         room_description:"Best roomz EVA!",
                                         price_for_room:12.1, breakfast: true,
                                         :adress_attributes=>{country:"Third country",
                                                              state:"Third state",
                                                              city:"Third City",
                                                              street:"Third street"})
      @fst_hotel.save
      @scd_hotel.save
      @trd_hotel.save

      @first_user.rate_hotel_by_value!(@fst_hotel,5)
      @first_user.rate_hotel_by_value!(@scd_hotel,4)
      @first_user.rate_hotel_by_value!(@trd_hotel,3)
      @second_user.rate_hotel_by_value!(@fst_hotel,5)
      @second_user.rate_hotel_by_value!(@scd_hotel,4)
    end
    describe "already rated hotel" do
      before {@raiting=@first_user.rate_hotel_by_value(@fst_hotel, 4)}
      it do
        #binding.pry
        should be_invalid
        end
      before {@raiting=@second_user.rate_hotel_by_value(@fst_hotel, 4)}
      it{should be_invalid}
    end
    describe "not rated hotel" do
      before {@raiting=@second_user.rate_hotel_by_value(@trd_hotel, 3)}
      it{should be_valid}
    end
  end


end