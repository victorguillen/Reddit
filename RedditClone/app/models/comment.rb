class Comment < ActiveRecord::Base
  include Votable

  validates :body, :author, :post, presence: true

  belongs_to :post

  belongs_to(
    :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )
  
  belongs_to(
    :parent_comment,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: "Comment"
  )

  has_many(
    :child_comments,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
  )
end
  ````
