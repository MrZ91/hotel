require 'rails_helper'
describe "Adress model" do
  before do
    @user= User.new(name: "Example User", email: "example@mail.com",
                    password:"123123", password_confirmation: "123123")
    @user.save
    hotel=@user.hotels.build(title:"Example Hotel", room_description:"Best roomz EVA!",
                             price_for_room:12.1, breakfast:true )
    hotel.save
    @adress=hotel.build_adress(country:"First country", state:"First state",
                               city:"First City", street:"First street")
  end

  subject{@adress}

  it{should respond_to(:country)}
  it{should respond_to(:state)}
  it{should respond_to(:city)}
  it{should respond_to(:street)}
  it{should respond_to(:hotel_id)}

  describe "with empty" do
    describe "country name" do
      before{@adress.country =""}
      it{should be_invalid}
    end

    describe "state name" do
      before{@adress.state =""}
      it{should be_invalid}
    end

    describe "city name" do
      before{@adress.city =""}
      it{should be_invalid}
    end

    describe "street name" do
      before{@adress.street =""}
      it{should be_invalid}
    end
  end

  describe "with same" do
    before do
      another_hotel=@user.hotels.build(title:"Another Example Hotel",
                                       room_description:"Best roomz EVA!",
                                       price_for_room:12.1, breakfast: true,
                                       :adress_attributes=>{country:"Second country",
                                                            state:"Second state",
                                                            city:"Second City",
                                                            street:"Second street"})
      another_hotel.save
      @another_adress=another_hotel.adress
    end

    describe "country name" do

      before {@adress.country=@another_adress.country}
      it{should be_valid}

        describe " and state name" do
          before {@adress.state=@another_adress.state}
          it{should be_valid}

          describe "and city name" do
            before {@adress.city=@another_adress.city}
            it{should be_valid}

            describe "and street name" do
              before {@adress.street=@another_adress.street}
              it do
               #binding.pry
                should be_invalid
               end

            end
          end
        end
    end
  end
end