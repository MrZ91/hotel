require 'rails_helper'

describe "Hotel model" do
  before do
    @user= User.new(name: "Example User", email: "example@mail.com",
                    password:"123123", password_confirmation: "123123")
    @hotel=@user.hotels.build(title:"Example Hotel",
                     room_description:"Best roomz EVA!",
                     price_for_room:12.1)
  end

  subject {@hotel}

  it {should respond_to(:title)}
  it {should respond_to(:room_description)}
  it {should respond_to(:price_for_room)}
  it {should respond_to(:adress)}
  it {should respond_to(:pictures)}
  it {should respond_to(:average_raiting)}

  describe "with empty title" do
    before{@hotel.title=" "}
    it {should_not be_valid}
  end

  describe "with empty room dscription" do
    before{@hotel.room_description=" "}
    it {should_not be_valid}
  end

  describe "without room price" do
    before{@hotel.price_for_room=" "}
    it {should_not be_valid}
  end

  describe "for hotels with same name" do
    before do
      another_user=User.new(name:"Another User",
                            email:"another.mail@mail.com",
                            password:"123123",
                            password_confirmation:"123123")
      @same_hotel=another_user.hotels.new(title:@hotel.title,
                                         room_description:"Beta roomz EVA!",
                                         price_for_room:12.1, user_id:another_user.id)
    end
    specify {expect(@same_hotel).not_to be_valid}
  end


end