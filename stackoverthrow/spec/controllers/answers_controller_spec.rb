require 'spec_helper'

describe AnswersController do
  let!(:answer){ create :answer }
  let!(:question){ create :question }

  describe "#new" do
    it "should be successful" do
      get :new, :question_id => question.id
      expect(response).to be_success
    end

    it "should assign an instance" do
      get :new, :question_id => question.id
      expect(assigns(:answer)).to be_a_new Answer
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "should create an answer" do
        expect {
          post :create, :question_id => question.id, :answer => attributes_for(:answer)
          expect(response).to be_redirect
        }.to change { Answer.count }.by(1)
      end
    end

    context "with invalid attributes" do
      it "shouldn't create an answer" do
        expect {
          post :create, :question_id => question.id, :answer => { text: nil }
          expect(response).to_not be_redirect
        }.to_not change { Answer.count }
      end
    end
  end
end