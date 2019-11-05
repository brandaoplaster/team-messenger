require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do

    context "Team exists" do
      it "Returns success" do
        team = create(:team, user: @current_user)
        get :show, params: { slug: team.slug }
        expect(response).to have_http_status(:success)
      end
    end

    context "User is member of the team" do
      it "Returns success" do
        team = create(:team)
        team.users << @current_user
        get :show, params: { slug: team.slug }
        expect(response).to have_http_status(:success)
      end
    end

    context "User is not the owner or member of the team" do
      it "Redirect to root" do
        team = create(:team)
        get :show, params: { slug: team.slug }
        expect(response).to redirect_to('/')
      end
    end

    context "team don't exists" do
      it "Redirects to root" do
        team_attributes = attibutes_for(:team)
        get :show, params: { slug: team_attributes[:slug] }
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "POST #create" do

  end

  describe "DELETE #destroy" do

  end

end