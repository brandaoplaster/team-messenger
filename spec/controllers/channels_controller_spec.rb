require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'

    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactorGirl.create(:user)
    sign_in @current_user
  end

  describe "POST #create" do
    render_views

    context "User is team member" do

      before(:each) do
        @team = create(:team)
        @team.users << @current_user

        @channel_attributes = attributes_for(:channel, team: @team, user: @current_user)
        post :create, params: { channel: @channel_attributes.merge(team_id: @team.id) }
      end

      it "Returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "Channel is created with right params" do
        expect(Channel.last.slug).to eql(@channel_attributes[:slug])
        expect(Channel.last.user).to eql(@current_user)
        expect(Channel.last.team).to eql(@team)
      end

      it "Returns right values to channel" do
        response_hash = JSON.parser(response.body)

        expect(response_hash["user_id"]).to eql(@current_user.id)
        expect(response_hash["slug"]).to eql(@channel_attributes[:slug])
        expect(response_hash["team_id"]).to eql(@team.id)
      end
    end

    context "User isn't team member" do
      before(:each) do
        @team = create(:team)
        @channel_attributes = attributes_for(:channel, team: @team)
        post :create, params: { channel: @channel_attributes.merge(team_id: @team.id) }
      end

      it "Returns http forbidden" do
        expect(response).to have_http_status(:forbidden)
      end

    end
  end

  describe "GET #show" do
    render_views

    context "User is team member" do

      before(:each) do
        team = create(:team, user: @current_user)
        @channel = create(:channel, team: team)

        @message_one = build(:message)
        @message_two = build(:message)

        @channel.messages << [@message_one, @message_two]

        get :show, params: { id: @channel.id }
      end

      it "Returns http success" do
        expect(response).to have_http_status(:seccess)
      end

      it "Returns right channel values" do
        response_hash = JSON.parse(response.body)

        expect(response_hash["slug"]).to eql(@channel.slug)
        expect(response_hash["user_id"]).to eql(@channel.user.id)
        expect(response_hash["team_id"]).to eql(@channel.team.id)
      end

      it "Returns the right number of messages" do
        response_hash = JSON.parse(response.body)
        expect(response_hash["messages"].count).to eql(2)
      end

      it "Returns the right messages" do
        response_hash = JSON.parse(response.body)

        expect(response_hash["messages"][0]["body"]).to eql(@message_one.body)
        expect(response_hash["messages"][0]["user_id"]).to eql(@message_one.user.id)
        expect(response_hash["messages"][1]["body"]).to eql(@message_two.body)
        expect(response_hash["messages"][1]["user_id"]).to eql(@message_two.user.id)
      end

    end

    context "User is not team member" do

      it "Returns http forbidden" do
        channel = create(:channel)

        get :show, params: { id: channel.id }

        expect(response).to have_http_status(:forbidden)
      end

    end

  end

  describe "DELETE #destroy" do
    context "User is team member" do
      context "User is the chennel owner" do
        it "Returns http sucess" do
          team = create(:team)
          team.users << @current_user

          @channel = create(:channel, team: team, user: @current_user)

          delete :destroy, params: { id: @channel.id }

          expect(response).to have_http_status(:success)
        end
      end
    end

    context "User is the team owner" do
      it "Returns http success" do
        team = create(:team, user: @current_user)
        @channel_owner = create(:user)
        team.users << @channel_owner

        @channel = create(:channel, team: team, user: @channel_owner)
        delete :destroy, params: { id: @channel.id }

        expect(response).to have_http_status(:success)
      end
    end

    context "User isn't the team or channel owner" do
      it "Returns http forbidden" do
        team = create(:team)
        team.users << @current_user

        @channel = create(:channel, team: team)
        delete :destroy, params: { id: @channel.id }

        expect(response).to have_http_status(:forbidden)
      end
    end

    context "User isn't team member" do
      it "Returns http forbidden" do
        team = create(:team)
        @channel = create(:channel, team: team)

        delete :destroy, params: { id: @channel.id }

        expect(response).to have_http_status(:forbidden)
      end
    end

  end

end