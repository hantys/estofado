# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'settings/new', type: :view do
  before do
    assign(:setting, Setting.new(
                       customer_reminder: 1
                     ))
  end

  it 'renders new setting form' do
    render

    assert_select 'form[action=?][method=?]', settings_path, 'post' do
      assert_select 'input[name=?]', 'setting[customer_reminder]'
    end
  end
end
