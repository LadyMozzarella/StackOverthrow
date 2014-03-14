require 'spec_helper'

describe Answer do
  context "validations" do
    it { should validate_presence_of :text }
  end

  context "associations" do
    it { should belong_to(:question) }
  end
end