require 'spec_helper'

describe VotesController do
  before(:each) do
    @question_vote = FactoryGirl.create(:question_vote)
    @question = @question_vote.vote
  end

  let!(:question){ create :question }
  let!(:answer){ create :answer }
  let!(:user){ create :user }
  let!(:vote){ Vote.new(votable_id: question.id,
                        votable_type: question,
                        user_id: user.id,
                        vote: '1'
                         ) }


  describe "#create" do
    context "user logged in" do

      it "should be able to vote on a question" do
          p @question
          new_vote = question.votes.create!(vote: '1', user_id:'1')
          p new_vote
          expect {
          post :create, :vote => vote
          expect(response).to be_success
        }.to change{ Vote.count }.by(1)
      end

      it "should not be able to vote the same twice on a question"
       

      it "should be able to vote on an answer"
      
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