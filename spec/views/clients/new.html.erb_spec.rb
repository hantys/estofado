require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      :name => "MyString",
      :cpf => "MyString",
      :image => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[cpf]"

      assert_select "input[name=?]", "client[image]"

      assert_select "input[name=?]", "client[status]"
    end
  end
end
