require 'spec_helper'

describe QuestionsController do
  let!(:question){ create :question }
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
end