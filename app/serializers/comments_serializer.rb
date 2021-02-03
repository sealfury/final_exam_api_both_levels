class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
end
