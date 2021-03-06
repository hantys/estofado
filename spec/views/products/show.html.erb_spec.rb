# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before do
    @product = assign(:product, Product.create!(
                                  name: 'Name',
                                  note: 'MyText',
                                  status: 2
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
