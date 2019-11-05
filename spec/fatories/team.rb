FactoryGirl.define do
  factoy :team do
    slug { FFacker::Lorem.word }
    user
  end
end
