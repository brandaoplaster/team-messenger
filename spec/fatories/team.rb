FactoryGirl.define do
  factoy :team do
    slug { FFaker::Lorem.word }
    user
  end
end
