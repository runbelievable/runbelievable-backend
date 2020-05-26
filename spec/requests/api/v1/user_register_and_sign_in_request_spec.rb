require 'rails_helper'

RSpec.describe 'User registration endpoint' do
  it 'It can take in registration from user ' do

    post '/api/v1/users', params: { first_name: "john",
                                    last_name: "brown",
                                    age: "99",
                                    username: "fun",
                                    password: "fun2",
                                    gender: "man",
                                    max_run_distance: 5,
                                    estimated_mile_pace: "08:00"}


    expect(response).to be_successful
    user = User.last
    expect(user.username).to eq('fun')
  end

#   it 'Bad registration attempts not sucessfull and render faileduser serializer' do

#     post '/api/v1/users', params: {
#                                     email: 'whatever@example.com',
#                                     password: 'password',
#                                     password_confirmation: 'notthesame'}.to_json,
#                          headers: {
#                                   'Content-Type' => 'application/json',
#                                   'Accept' => 'application/json'
#                                   }

#     expect(response).to_not be_successful
#     expect(response.status).to eq(401)
#     json = JSON.parse(response.body, symbolize_names: true)
#     expect(json[:data][:attributes].values.join).to eq("doesn't match Password")
#   end

end
