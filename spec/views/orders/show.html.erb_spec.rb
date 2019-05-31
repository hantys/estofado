# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/show', type: :view do
  before do
    @order = assign(:order, Order.create!(
                              user: nil,
                              client: nil,
                              product: nil,
                              cost: 2.5,
                              paid: 3.5,
                              status: 4,
                              note: 'MyText'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
