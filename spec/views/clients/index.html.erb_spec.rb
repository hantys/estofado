require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :name => "Name",
        :cpf => "Cpf",
        :image => "Image",
        :status => "Status"
      ),
      Client.create!(
        :name => "Name",
        :cpf => "Cpf",
        :image => "Image",
        :status => "Status"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
