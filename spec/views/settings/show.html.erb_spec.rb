# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'settings/show', type: :view do
  before do
    @setting = assign(:setting, Setting.create!(
                                  customer_reminder: 2
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
  end
end
