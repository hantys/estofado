# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payments/show', type: :view do
  before do
    @payment = assign(:payment, Payment.create!(
                                  user: nil,
                                  order: nil,
                                  value: 2.5,
                                  status: 3,
                                  note: 'MyText'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
