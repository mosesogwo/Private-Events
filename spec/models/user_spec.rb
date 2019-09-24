require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each)do
        @user = User.create!(name: "Uche", email: "uche@gmail.com", password: "123asdf")
    end

    describe "creation" do
        it "should have one item created after being created" do
            expect(User.all.count).to eq(1)
        end
    end
    describe "validations" do
        it "is not valid without a name" do
            @user.name = nil
            expect(@user).to_not be_valid
        end

        it "is not valid without an email" do
            @user.email = nil
            expect(@user).to_not be_valid
        end

        it "is not valid without a password" do
            @user.password = nil
            expect(@user).to_not be_valid
        end
    end
end
