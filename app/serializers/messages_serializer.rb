class MessagesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :topic, :body, :created_at, :updated_at, :received_messageable_id, :sent_messageable_id
end