# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/index', type: :view do
  before do
    assign(:payments, [
             Payment.create!(
               user: nil,
               order: nil,
               value: 2.5,
               status: 3,
               note: 'MyText'
             ),
             Payment.create!(
               user: nil,
               order: nil,
               value: 2.5,
               status: 3,
               note: 'MyText'
             )
           ])
  end

  it 'renders a list of payments' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
