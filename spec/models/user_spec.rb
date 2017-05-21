require 'rails_helper'

RSpec.describe User, type: :model do
  it "create a success user" do
  	user = User.create! name: "Bach Van Ngoc", github_id: "NeverSmileK57CLC", chatwork_id: "1614642",
  		email: "neversmile12b1@gmail.com", password: "123123"
  	expect(User.count).to eq(1)
  end
end
