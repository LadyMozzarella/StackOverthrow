require 'spec_helper'

describe VotesController do

  let!(:question){ create :question }
  let!(:answer){ create :answer }
  let!(:user){ create :user }
  let!(:vote){ Vote.new(votable_id: question.id,
                        votable_type: question,
                        user_id: user.id,
                        up_down: 1
                         )}


  describe "#create" do
    context "user logged in" do

      it "should be able to vote on a question" do
        expect {
          session[:id] = user.id
          post :create, :question_id => question.id, :up_down=> vote.up_down
          expect(response).to be_redirect
        }.to change{ Vote.count }.by(1)
      end

      it "should be able to vote on an answer" do
        expect {
          session[:id] = user.id
          post :create, :answer_id => answer.id, :up_down=> vote.up_down
          expect(response).to be_redirect
        }.to change{ Vote.count }.by(1)
      end

      it "should not be able to vote twice on a question"
      it "should not be able to vote twice on an answer"
    end
  end

  # describe "#create" do
  #   context "with valid attributes" do
  #     it "should create an answer" do
  #       expect {
  #         post :create, :question_id => question.id, :answer => attributes_for(:answer)
  #         expect(response).to be_redirect
  #       }.to change { Answer.count }.by(1)
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "shouldn't create an answer" do
  #       expect {
  #         post :create, :question_id => question.id, :answer => { text: nil }
  #         expect(response).to_not be_redirect
  #       }.to_not change { Answer.count }
  #     end
  #   end
  # end

  # context "#edit" do
  #   it "should be successful" do
  #     get :edit, :question_id => question.id, :id => answer.id
  #     expect(response).to be_success
  #   end
  # end

  # context "#update" do
  #   context "with valid attributes" do
  #     it "updates the attributes" do
  #       expect {
  #         put :update, :question_id => question.id, :id => answer.id, :answer => { text: "New Text" }
  #         expect(response).to be_redirect
  #       }.to change{ answer.reload.text }.to ("New Text")
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "doesn't update the attributes" do
  #       expect {
  #         put :update, :question_id => question.id, :id => answer.id, :answer => { text: nil }
  #         expect(response).to_not be_redirect
  #       }.to_not change{ answer.reload.text }
  #     end
  #   end
  # end

  # context "#destroy" do
  #   it "deletes a comment" do
  #     expect {
  #       delete :destroy, :question_id => question.id, :id => answer.id
  #       expect(response).to be_redirect
  #     }.to change{ Answer.count }.by(-1)
  #   end
  # end
end