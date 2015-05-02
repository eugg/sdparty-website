require "rails_helper"

describe Issue do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :issue
    }.to change { Issue.count }.by(1)
  end
end
