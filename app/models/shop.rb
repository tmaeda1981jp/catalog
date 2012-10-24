class Shop < ActiveRecord::Base
  attr_accessible :description, :image, :lines_summary, :name, :image_cache
  mount_uploader :image, ShopImageUploader

  validates_uniqueness_of :name
  validates_presence_of :name, :description, :lines_summary
end
