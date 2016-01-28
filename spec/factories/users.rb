FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user-#{n}@flanger.com"
    end
    sequence :username do |n|
      "user-#{n}"
    end
    password "password"

    after(:build) { |u| u.password_confirmation = u.password }
  end
end
