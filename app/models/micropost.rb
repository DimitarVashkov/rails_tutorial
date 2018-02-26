class Micropost < ApplicationRecord
  belongs_to :user
  # The microposts are ordered by descending order based on creation time by default
  # http://guides.rubyonrails.org/active_record_querying.html#scopes
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
