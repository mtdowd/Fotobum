class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  has_many :comments
  has_many :likes

  has_and_belongs_to_many :groups

  validates :name, :description, :url, presence: true
end
