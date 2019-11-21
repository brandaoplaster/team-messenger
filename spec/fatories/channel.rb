FactoryGirl.define do
  factoy :channel do
    slug { FFaker::Lorem.word }
    team
    user { team.user }
  end
end
