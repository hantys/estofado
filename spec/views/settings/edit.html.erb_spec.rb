# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'settings/edit', type: :view do
  before do
    @setting = assign(:setting, Setting.create!(
                                  customer_reminder: 1
                                ))
  end

  it 'renders the edit setting form' do
    render

    assert_select 'form[action=?][method=?]', setting_path(@setting), 'post' do
      assert_select 'input[name=?]', 'setting[customer_reminder]'
    end
  end
end
