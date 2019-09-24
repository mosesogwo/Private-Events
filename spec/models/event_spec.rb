require 'rails_helper'

RSpec.describe Event, type: :model do
  
    before(:each)do
      @user = User.create!(name: "Moses", email: "moses@gmail.com", password: "asdf4321")
      @event = Event.create!(name: "event_name", date: "05-12-2019", creator_id: 1)
    end

    describe "creation" do
      it "should have one item created after being created" do
        expect(Event.all.count).to eq(1)
      end
    end

    describe "validations" do
      it "is not valid without an event_name" do
        @event.name = nil
        expect(@event).to_not be_valid
      end

      it "is not valid without a date" do
        @event.date = nil
        expect(@event).to_not be_valid
      end
    end
end

