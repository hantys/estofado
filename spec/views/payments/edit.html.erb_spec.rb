# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/edit', type: :view do
  before do
    @payment = assign(:payment, Payment.create!(
                                  user: nil,
                                  order: nil,
                                  value: 1.5,
                                  status: 1,
                                  note: 'MyText'
                                ))
  end

  it 'renders the edit payment form' do
    render

    assert_select 'form[action=?][method=?]', payment_path(@payment), 'post' do
      assert_select 'input[name=?]', 'payment[user_id]'

      assert_select 'input[name=?]', 'payment[order_id]'

      assert_select 'input[name=?]', 'payment[value]'

      assert_select 'input[name=?]', 'payment[status]'

      assert_select 'textarea[name=?]', 'payment[note]'
    end
  end
end
