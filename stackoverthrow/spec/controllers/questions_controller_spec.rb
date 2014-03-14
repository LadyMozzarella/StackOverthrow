require 'spec_helper'

describe QuestionsController do
  let!(:question){ create :question }

  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "initialize question instance var" do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  context "#create" do
    context "valid attributes" do
      it "creates a new question" do
        expect {
          get :create, :question => attributes_for(:question)
          expect(response).to be_redirect
        }.to change { Question.count }.by(1)
      end
    end

    context "invalid attributes" do
      it "doesn't create a new question"
    end
  end
end