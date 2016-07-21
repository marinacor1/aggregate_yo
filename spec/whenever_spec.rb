require 'rails_helper'

describe Whenever Schedule, do
  let(:whenever) do
    Whenever::Company.new(file: Rails.root.join("config", "schedule.rb").to_s)
  end

  it "schedules updates to company database" do
    expect(whenever).to schedule_rake("company_update")
    .every(1.day)
  end
end
