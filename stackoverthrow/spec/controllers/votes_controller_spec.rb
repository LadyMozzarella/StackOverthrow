require 'spec_helper'

describe VotesController do

  let!(:question){ create :question }
  let!(:answer){ create :answer }
  let!(:user){ create :user }

  describe "#create" do
    context "user logged in" do

      it "should be able to vote on a question" do
        expect {
          session[:id] = user.id
          post :create, :question_id => question.id, :up_down=> 1
          expect(response).to be_redirect
        }.to change{ Vote.count }.by(1)
      end

      it "should be able to vote on an answer" do
        expect {
          session[:id] = user.id
          post :create, :answer_id => answer.id, :up_down=> 1
          expect(response).to be_redirect
        }.to change{ Vote.count }.by(1)
      end

      it "should not be able to vote twice on a question" do
        question.votes.create(user_id: user.id, up_down: 1)
        expect {
          session[:id] = user.id
          post :create, :question_id => question.id, :up_down=> 1
          expect(response).to be_redirect
        }.to_not change{ Vote.count }
      end

      it "should not be able to vote twice on an answer" do
        answer.votes.create(user_id: user.id, up_down: 1)
        expect {
          session[:id] = user.id
          post :create, :answer_id => answer.id, :up_down=> 1
          expect(response).to be_redirect
        }.to_not change{ Vote.count }
      end
    end

    context "not logged in" do
      it "should not be able to vote on a question" do
        expect {
          post :create, :question_id => question.id, :up_down=> 1
          expect(response).to be_redirect
        }.to_not change{ Vote.count }
      end
    end
  end
end