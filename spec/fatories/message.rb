FactoryGirl.define do
  factoy :message do
    body { FFacker::Lorem.sentence }
    user
  end
end

