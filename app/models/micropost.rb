class Micropost < ApplicationRecord
  belongs_to :user
  # The microposts are ordered by descending order based on creation time by default
  # http://guides.rubyonrails.org/active_record_querying.html#scopes
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
