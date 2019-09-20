class Event < ApplicationRecord

  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances
end

def Event.past
  Event.where("date <= ?", Date.today)
end

def Event.upcoming
   Event.where("date > ?", Date.today)
end