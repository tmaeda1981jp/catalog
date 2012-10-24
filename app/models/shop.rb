class Shop < ActiveRecord::Base
  attr_accessible :description, :image, :lines_summary, :name, :image_cache
  mount_uploader :image, ShopImageUploader
end
