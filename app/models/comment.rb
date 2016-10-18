class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user, foreign_key: :commenter_id
  has_many :sibiling_comments, through: :post, source: :comments
end
