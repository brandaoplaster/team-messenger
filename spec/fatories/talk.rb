FactoryGirl.define do
  factoy :talk do
    user_one { create(:user) }
    user_two { create(:user) }
    team
  end
end

