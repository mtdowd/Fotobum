class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  has_many :comments

  validates :name, :description, :url, presence: true
end
