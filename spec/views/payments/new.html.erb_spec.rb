# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/new', type: :view do
  before do
    assign(:payment, Payment.new(
                       user: nil,
                       order: nil,
                       value: 1.5,
                       status: 1,
                       note: 'MyText'
                     ))
  end

  it 'renders new payment form' do
    render

    assert_select 'form[action=?][method=?]', payments_path, 'post' do
      assert_select 'input[name=?]', 'payment[user_id]'

      assert_select 'input[name=?]', 'payment[order_id]'

      assert_select 'input[name=?]', 'payment[value]'

      assert_select 'input[name=?]', 'payment[status]'

      assert_select 'textarea[name=?]', 'payment[note]'
    end
  end
end
