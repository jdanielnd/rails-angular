FactoryGirl.define do
  factory :post do
    sequence :title do |n|
      "Post #{n}"
    end
    sequence :link do |n|
      "http://www.#{n}.com"
    end
    upvotes Random.new.rand(100)
    user
  end
end
