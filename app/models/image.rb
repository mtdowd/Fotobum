class Image < ActiveRecord::Base
  belongs_to :gallery

  validates :name, :description, :url, presence: true
end
