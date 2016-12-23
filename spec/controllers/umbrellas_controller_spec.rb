require 'rails_helper'

RSpec.describe UmbrellasController, type: :controller do
  let(:l1) {Location.create(:name => 'location1')}
  let(:l2) {Location.create(:name => 'location2')}
  let(:u1) {User.create(:email => 'xxx@hotmail.com', :password => '123456')}


  before do
  end

  it '#index' do
  end
end
