# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def find_by_address
    api = CorreiosECT::Api.new
    address = api.consulta_cep params[:cep]
    if address.present?
      state = State.where(acronym: address['uf']).first
      city = City.where(name: address['cidade']).first
      cities = City.where(state_id: state.id).select(:id, :name).order(:name)
      address_full = { bairro: address['bairro'], cep: address['cep'], city: city.id, street: address['end'], id: address['id'], state: state.id, cities: cities }
    else
      address_full = 0
    end
    render json: address_full
  end

  def find_city
    cities = City.where(state_id: params[:id]).select(:id, :name).order(:name)

    render json: cities
  end
end
