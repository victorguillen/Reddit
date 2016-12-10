class Post < ActiveRecord::Base
  include Votable

  validates :title, :user_id, presence: true

  has_many :comments
  has_many :user_votes, as: :votable, class_name: "UserVote"

  belongs_to(
    :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )

  has_many(
    :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    dependent: :destroy,
    class_name: "Post_sub"
  )

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  def comments_by_parent
    comments_by_parent = Hash.new { |hash, key| hash[key] = []}

    self.comments.includes(:author).each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end

    comments_by_parent
  end
end
