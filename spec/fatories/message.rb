FactoryGirl.define do
  factoy :message do
    body { FFaker::Lorem.sentence }
    user
  end
end

