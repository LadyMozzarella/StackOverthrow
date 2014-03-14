require 'spec_helper'

describe QuestionsController do
  render_views
  let!(:question){ create :question }

  describe "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "shows a question title" do
      get :index
      expect(response.body).to include(question.title)
    end
  end

  describe "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "initialize question instance var" do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe "#create" do
    context "valid attributes" do
      it "creates a new question" do
        expect {
          post :create, :question => attributes_for(:question)
          expect(response).to be_redirect
        }.to change { Question.count }.by(1)
      end
    end

    context "invalid attributes" do
      it "doesn't create a new question for blank text field" do
        expect {
          post :create, :question => {title: "Blabadoobah", text: nil}
          expect(response).to render_template('questions/new')
        }.to_not change{ Question.count }
      end

      it "doesn't create a new question for blank title field" do
        expect {
          post :create, :question => {title: nil, text: "Something"}
          expect(response).to render_template('questions/new')
        }.to_not change{ Question.count }
      end
    end
  end

  describe "#edit" do
    it "should be successful" do
      get :edit, :id => question.id
      expect(response).to be_success
    end
  end

  context "#update" do
    context "with valid attributes" do
      it "updates the attributes" do
        expect {
          put :update, :id => question.id, :question => { text: "New Text" }
          expect(response).to be_redirect
        }.to change{ question.reload.text }.to ("New Text")
      end
    end

    context "with invalid attributes" do
      it "doesn't update the attributes" do
        expect {
          put :update, :id => question.id, :question => {
            text: nil, title: nil
          }
          expect(response).to_not be_redirect
        }.to_not change{ question.reload.text }
      end
    end

  end

  context "#destroy" do
    it "deletes a question and redirects" do
      expect {
        delete :destroy, :id => question.id
        expect(response).to be_redirect
      }.to change{ Question.count }.by(-1)
    end
  end
end