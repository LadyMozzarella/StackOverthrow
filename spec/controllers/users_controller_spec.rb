require 'spec_helper'

describe UsersController do
  render_views
  let!(:user){FactoryGirl.create(:user)}
  let(:attribs){FactoryGirl.attributes_for(:user)}

  describe '#show' do
    it "should show user profile" do
      session[:id] = user.id
      get :show , id: user.id
      expect(response.body).to include(user.username)
    end

    it "should assign user votes for profile" do
        get :show, id: user.id
        expect(assigns(:votes)).to eq([])
    end
  end

  describe '#new' do
    context 'logged in' do
      it "should redirect the user to their profile" do
        session[:id] = user.id
        get :new
        expect(response).to be_redirect
      end
    end

    context 'not logged in' do
      it 'respond is ok' do
        get :new
        expect(response).to be_ok
      end
      it "should show a new user form" do
        get :new
        expect(response.body).to include('form')
      end
    end
  end

  context '#create' do
    it "should add a new user to the database" do
      expect{post :create, user: attribs}.to change{User.count}.by(1)
    end
  end
end
