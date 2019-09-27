# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :create_remember_digest

  validates :name, presence: true
  validates :email, presence: true

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token.to_s))
  end

  private

  def create_remember_digest
    token = User.new_token
    self.remember_digest = User.digest(token.to_s)
  end
end
