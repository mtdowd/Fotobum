class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  validates :content, presence: true

  def self.by_most_recent
    order(created_at: :desc)
  end

end
