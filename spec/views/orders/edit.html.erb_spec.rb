# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/edit', type: :view do
  before do
    @order = assign(:order, Order.create!(
                              user: nil,
                              client: nil,
                              product: nil,
                              cost: 1.5,
                              paid: 1.5,
                              status: 1,
                              note: 'MyText'
                            ))
  end

  it 'renders the edit order form' do
    render

    assert_select 'form[action=?][method=?]', order_path(@order), 'post' do
      assert_select 'input[name=?]', 'order[user_id]'

      assert_select 'input[name=?]', 'order[client_id]'

      assert_select 'input[name=?]', 'order[product_id]'

      assert_select 'input[name=?]', 'order[cost]'

      assert_select 'input[name=?]', 'order[paid]'

      assert_select 'input[name=?]', 'order[status]'

      assert_select 'textarea[name=?]', 'order[note]'
    end
  end
end
