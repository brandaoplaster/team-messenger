FactoryGirl.define do
  factoy :user do
    name      { FFaker::Lorem.word }
    email     { FFaker::Internet.email }
    password  '123456'
  end
end