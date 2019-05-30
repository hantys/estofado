require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :name => "MyString",
      :cpf => "MyString",
      :image => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[cpf]"

      assert_select "input[name=?]", "client[image]"

      assert_select "input[name=?]", "client[status]"
    end
  end
end
