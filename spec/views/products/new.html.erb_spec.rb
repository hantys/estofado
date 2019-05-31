# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before do
    assign(:product, Product.new(
                       name: 'MyString',
                       note: 'MyText',
                       status: 1
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'textarea[name=?]', 'product[note]'

      assert_select 'input[name=?]', 'product[status]'
    end
  end
end
