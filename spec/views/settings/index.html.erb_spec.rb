# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'settings/index', type: :view do
  before do
    assign(:settings, [
             Setting.create!(
               customer_reminder: 2
             ),
             Setting.create!(
               customer_reminder: 2
             )
           ])
  end

  it 'renders a list of settings' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
