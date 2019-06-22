# frozen_string_literal: true

class Client < ApplicationRecord
  enum status: { normal: 0, pending: 1, ok: 2 }
  mount_uploader :image, FotoUploader
  has_one :address, as: :addressable, dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :orders

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :orders, allow_destroy: true

  validates_presence_of(:name)
  validates_presence_of(:cpf)
end
