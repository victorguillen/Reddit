class UserVote < ActiveRecord::Base
  validates :user, presence: true

  belongs_to :votable, polymorphic: true
  belongs_to :user
end
