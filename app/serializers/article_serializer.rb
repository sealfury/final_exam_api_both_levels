class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :comments, serializer: CommentsSerializer
end
