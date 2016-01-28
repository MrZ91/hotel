require 'rails_helper'

describe "User model" do
  before do
    @user= User.new(name: "Example User", email: "example@mail.com",
                    password:"123123", password_confirmation: "123123")
  end

  subject{@user}

  it{should respond_to(:name)}
  it{should respond_to(:email)}
  it{should respond_to(:password_digest)}
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should respond_to(:authenticate)}

  it{should be_valid}

  describe "with name" do

    describe "is empty" do
    before {@user.name=""}
    it {should_not be_valid}
    end

    describe "that's contains unresolved symbols" do
    before {@user.name="1@/#/%/$_"}
    it {should_not be_valid}
    end

    # describe "same as existing user" do
    #   before do
    #     existing_user= @user.dup
    #     existing_user.name = @user.name
    #     existing_user.save
    #   end
    #   it{should_not be_valid}
    # end
  end

  describe "with email" do

    describe "that's emtpy"do
    before {@user.email=""}
    it {should_not be_valid}
    end

    describe "form is invalid" do
      it "should not be valid" do
        email_adreses= %w[qwe.qwe.qwe qwe@@qwe.qwe qwe@qwe @qwe.qwe]
        email_adreses.each do |ema|
          @user.email=ema
          expect(@user).not_to be_valid
        end
        end
    end

    describe "form is valid" do
      it "should be valid" do
        email_adreses= %w[12_qwe@qwe.qwe QwE@qWe.qWe qwe.qwe-qwe@qwe.qwe]
        email_adreses.each do |ema|
          @user.email=ema
          expect(@user).to be_valid
        end
      end
    end

    describe "same as existing user" do
      before do
        existing_user= @user.dup
        existing_user.email = @user.email
        existing_user.save
      end
      it{should_not be_valid}
    end
  end

  describe "with password" do
    describe "that is emty" do
    before {@user.password_confirmation=@user.password="" }
    it {should_not be_valid}
    end

    describe "that missmatch confirmation" do
      before{@user.password_confirmation=@user.password+"1"}
      it {should_not be_valid}
    end

    describe "that's to short" do
      before{@user.password_confirmation=@user.password="1234"}
      it {should_not be_valid}
    end

    describe "that contains unresolved symbols" do
      before{@user.password=@user.password_confirmation="._-\!\@\#\$"}
      it {should_not be_valid}
    end
  end

end