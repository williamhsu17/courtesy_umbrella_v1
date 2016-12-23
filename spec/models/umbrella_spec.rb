require 'rails_helper'

RSpec.describe Umbrella, type: :model do
  let(:l0) {Location.create(:name => 'location0')}
  let(:l1) {Location.create(:name => 'location1')}
  let(:l2) {Location.create(:name => 'location2')}
  let(:u1) {User.create(:email => 'xxx@hotmail.com', :password => '123456')}

  before(:each) do
  end
  describe
  it "umbrella default" do
    l0
    l1
    u1
    umb1 = Umbrella.create
    expect(umb1.umbrella_holder == l0).to eq(true)
  end
end
