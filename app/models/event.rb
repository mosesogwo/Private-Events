# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validate :event_date_cannot_be_in_the_past

  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances

  scope :past, -> { where('date <= ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }

  def event_date_cannot_be_in_the_past
    return errors.add(:date, "Event date can't be in the past") unless date >= Date.today
  end
end
