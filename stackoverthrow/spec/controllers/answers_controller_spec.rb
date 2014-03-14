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

  end
end