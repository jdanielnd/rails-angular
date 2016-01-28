require 'rails_helper'
RSpec.describe "Posts API" do
  it 'gets all posts' do
    FactoryGirl.create_list(:post, 10)

    get '/posts.json'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json.length).to eq(10)
  end

  it 'posts includes users' do
    FactoryGirl.create_list(:post, 1)

    get '/posts.json'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    expect(json.first).to have_key("user")
  end

  it 'posts includes comments' do
    FactoryGirl.create_list(:post, 1)

    get '/posts.json'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    expect(json.first).to have_key("comments")
  end

end
