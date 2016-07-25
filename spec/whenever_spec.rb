describe Whenever do
  let(:whenever) do
    Whenever::Company.new(file: Rails.root.join("config", "schedule.rb").to_s)
  end

  it "schedules the sending of challenge submission digests" do
    expect(whenever).to schedule_rake("company_update")
      .every(1.day)
  end
end
