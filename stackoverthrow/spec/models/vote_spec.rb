require 'spec_helper'

describe Vote do
  context "validations" do
    it { should validate_presence_of :vote }
  end

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :votable }
  end
end