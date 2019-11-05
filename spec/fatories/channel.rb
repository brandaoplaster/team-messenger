FactoryGirl.define do
  factoy :channel do
    slug { FFacker::Lorem.word }
    team
    user { team.user }
  end
end
