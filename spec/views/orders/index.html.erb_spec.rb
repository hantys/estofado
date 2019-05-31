# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/index', type: :view do
  before do
    assign(:orders, [
             Order.create!(
               user: nil,
               client: nil,
               product: nil,
               cost: 2.5,
               paid: 3.5,
               status: 4,
               note: 'MyText'
             ),
             Order.create!(
               user: nil,
               client: nil,
               product: nil,
               cost: 2.5,
               paid: 3.5,
               status: 4,
               note: 'MyText'
             )
           ])
  end

  it 'renders a list of orders' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
