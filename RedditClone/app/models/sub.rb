class Sub < ActiveRecord::Base
  validates :name, :description, :moderator, presence: true
  validates :name, uniqueness: true

  belongs_to(
    :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: "User"
  )

  has_many(
    :post_subs,
    primary_key: :id,
    foreign_key: :sub_id,
    dependent: :destroy,
    class_name: "Post_sub"
  )

  has_many(
    :posts,
    through: :post_subs,
    source: :post
  )




end
