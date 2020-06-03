class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      render json: MessagesSerializer.new(current_user.messages)
  end

  def inbox #all recived messages
      user = User.find(params[:user_id])
      render json: MessagesSerializer.new(user.received_messages)
  end

  def outbox #all sent messages
      render json: MessagesSerializer.new(current_user.sent_messages)
  end

  def reply_to_message #rely to a specific person
     user = User.find(params[:user_id])

      reply_msg = user.messages.find_by(id: params[:message_id]).reply({topic: params[:topic], body: params[:body]})
      render json: MessagesSerializer.new(reply_msg.conversation)
  end

  def conversation_between #rely to a specific person
     user = User.find(params[:user_id])
     recipient = params[:username]
     from = user.messages.are_from(User.find_by(username: recipient))
     to = user.messages.are_to(User.find_by(username: recipient))
     conversation_msgs = to + from
      render json: MessagesSerializer.new(conversation_msgs)
  end

  def show_msg_conversation
      conversation_msgs = current_user.messages.find_by(id: params[:message_id]).conversation
      render json: MessagesSerializer.new(conversation_msgs)
  end

  def start_message_conv #Post to start message convo
      recipient = User.find_by(username: params[:username])
      user = User.find(params[:user_id])
      new_message = user.send_message(recipient, {topic: params[:topic], body: params[:body]})
      render json: MessagesSerializer.new(new_message)
  end
end
