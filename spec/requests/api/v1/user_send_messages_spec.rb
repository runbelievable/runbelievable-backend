require 'rails_helper'
describe 'As a user I can send a message to another user' do
    before :each do
        User.destroy_all
        @user1 = create(:user, username: "timmy", password: "tim")
        @user2 = create(:user, username: "jon23")
        @user3 = create(:user)
      
        post '/api/v1/login', params: { first_name: @user1.first_name,
                                        last_name: @user1.last_name,
                                        age: @user1.age,
                                        username: @user1.username,
                                        password: @user1.password,
                                        location: @user1.location,
                                        gender: @user1.location,
                                        max_run_distance: @user1.max_run_distance,
                                        estimated_mile_pace: @user1.estimated_mile_pace}
      
      
        @user1.send_message(@user2, { topic:"subject 1", body:"hello there im here too"})
        @user2.send_message(@user1,  { topic:"subject 2", body:"nah man  kiddiing"})
  end

  it "user can view all thier messages in index" do
    get "/api/v1/users/#{@user1.id}/messages"
    
    x = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(x.count).to eq(2)
    expect(@user1.sent_messages[0][:topic]).to eq(x[1][:attributes][:topic])    
  end

  it "user view only their inbox" do
    @user2.send_message(@user1,  { topic:"subject 3", body:"nah man  "})
    get "/api/v1/users/#{@user1.id}/inbox"
    
    x = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(x.count).to eq(2)
    expect(@user1.received_messages[0][:topic]).to eq(x[0][:attributes][:topic])    
  end

  it "user view only their outbox" do
     @user1.send_message(@user2, { topic:"subject 2394", body:"hello there im here too"})

    get "/api/v1/users/#{@user1.id}/outbox"
    
    x = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(x.count).to eq(2)
    expect(@user1.sent_messages[0][:topic]).to eq(x[0][:attributes][:topic])    
  end

  it "user get all messages in a conversation" do
   x =  @user1.send_message(@user2, { topic:"subject 1 of many", body:"hello there im here too"})
   y = x.reply({ topic:"subject 2 of many", body:"hello there im here too"})
   y.reply({ topic:"subject 3 of many", body:"hello there im here too"})

    get "/api/v1/users/#{@user1.id}/messages/#{x.id}"
    
    msg = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(msg.count).to eq(3)
    expect(msg[0][:attributes][:topic]).to eq("subject 3 of many")    
    expect(msg[1][:attributes][:topic]).to eq("subject 2 of many")    
    expect(msg[2][:attributes][:topic]).to eq("subject 1 of many")    
  end

  it "user can respond to single message making conversation" do
   x =  @user1.send_message(@user2, { topic:"subject 1 of many", body:"hello there im here too"})
   y = x.reply({ topic:"subject 2 of many", body:"hello there im here too"})
   y.reply({ topic:"subject 3 of many", body:"hello there im here too"})

   convo_params = {topic: "this is a brand new topic", body: "this is a brand new body"}

    post "/api/v1/users/#{@user1.id}/messages/#{x.id}", params: convo_params
    
    msg = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(msg.count).to eq(4)
    expect(msg[0][:attributes][:topic]).to eq("this is a brand new topic")    
    expect(msg[3][:attributes][:topic]).to eq("subject 1 of many")    
  end

  it "user can create a new message and send it to another user" do
    message_params = {topic: "this is a brand new messge", body: "first of all time", username: "jon23" } 
    
    post "/api/v1/users/#{@user1.id}/messages", params: message_params
    
    x = JSON.parse(response.body, symbolize_names:true)[:data]
    expect(x.count).to eq(3)
    expect(x[:attributes].count).to eq(6)
    expect(@user1.id).to_not eq(x[:attributes][:received_messageable_id])    
  end
end