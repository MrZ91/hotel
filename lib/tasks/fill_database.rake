namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_hotels
    #rate_hotels_rand
    rate_hotels_all
  end
  @user_count=14
  @hotel_count=30
end

def make_users
  User.create!(name:"First User",
  email:"first_user@example.com",
  password:"123123123",
  password_confirmation:"123123123")

  @user_count.times do |i|
    first_name=Faker::Name.first_name
    last_name=Faker::Name.last_name
    name="#{first_name} #{last_name}"
    email=Faker::Internet.safe_email("#{first_name}-#{i+1}_user")
    pass=Faker::Internet.password(8)
    User.create!(name:name, email:email, password:pass, password_confirmation:pass)
  end
end

def make_hotels
  User.first.hotels.create!(title:"First Hotel",
                            room_description:"Best roomz EVA!",
                            price_for_room:12.1, breakfast:true,
                            :adress_attributes=>{country:"First Country",
                                                 state:"First State",
                                                 city:"First City",
                                                 street:"First Street"})
  @hotel_count.times do |i|
    country=Faker::Address.country
    state=Faker::Address.state
    city=Faker::Address.city
    street=Faker::Address.street_name
    name="#{country} #{Faker::Lorem.word} hotel"
    room_desc=Faker::Lorem.paragraph(5)
    price=Faker::Number.decimal(2)
    if (i%2==0)
      breakfast=true
    else
      breakfast=false
    end

    usr_id=rand(@user_count)+1
    this_hotel=User.find_by(id:usr_id).hotels.create!(title:"#{i} #{name}",
                       room_description:room_desc,
                       price_for_room:price, breakfast: breakfast,
                       :adress_attributes=>{country:country,
                                            state:state,
                                            city:city,
                                            street:street},)
    end
end

def rate_hotels_rand
  users=User.all
  hotels_id=random_from(30,@hotel_count+1)
  users.each do |usr|
    hotels_id.each do |htl|
      usr.rate_hotel_by_value!(Hotel.find_by(id:htl),(rand(4)+1))
    end
end
end

def rate_hotels_all
  User.all.each do |usr|
    Hotel.all.each do |htl|
      usr.rate_hotel_by_value!(Hotel.find_by(id:htl),(rand(4)+1))
    end
  end
end

def random_from(n, from)
  array_of_id=[]
  while array_of_id.count<=n
    rnd=rand(from+1)
    array_of_id<<rnd if !array_of_id.include?(rnd)
  end
  array_of_id
end

def random_lorempixel
    x=rand(600..800)
    y=rand(800..1024)
    return "http://lorempixel.com/#{x}/#{y}/city"
end

