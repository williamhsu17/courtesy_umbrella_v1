require 'rails_helper'

RSpec.describe Admin::EnterpriseController, type: :controller do

  describe "GET #name:string" do
    it "returns http success" do
      get :name:string
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #description:text" do
    it "returns http success" do
      get :description:text
      expect(response).to have_http_status(:success)
    end
  end

end
