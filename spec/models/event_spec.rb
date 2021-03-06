# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create!(name: 'Moses', email: 'moses@gmail.com', password: 'asdf4321')
    @event = Event.create!(name: 'event_name', date: '05-12-2019', creator_id: 1)
  end

  describe 'creation' do
    it 'should have one more item after being created' do
      expect do
        Event.create!(name: 'event_name', date: '05-12-2019', creator_id: 1)
      end.to change { Event.all.count }.by(1)
    end
  end

  describe 'validations' do
    it 'is not valid without an event_name' do
      @event.name = nil
      expect(@event).to_not be_valid
    end

    it 'is not valid without a date' do
      @event.date = nil
      expect(@event).to_not be_valid
    end

    it 'is not valid with a past date' do
      @event.date = '05-12-1998'
      expect(@event).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a User(creator)' do
      assc = described_class.reflect_on_association(:creator)
      expect(assc.macro).to eql :belongs_to
    end

    it 'has many attendances' do
      assc = described_class.reflect_on_association(:attendances)
      expect(assc.macro).to eql :has_many
    end

    it 'has many attendees' do
      assc = described_class.reflect_on_association(:attendees)
      expect(assc.macro).to eql :has_many
    end
  end
end
