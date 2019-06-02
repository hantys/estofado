# frozen_string_literal: true

class User < ApplicationRecord
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :c and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :addresses, as: :addressable
  has_many :phones, as: :phoneable
  has_many :payments
  has_many :orders

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.strip.downcase }]).first
  end

  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    # assuming you have deleted_at column added already
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
