class Shop < ActiveRecord::Base
  attr_accessible :description, :image, :lines_summary, :name
end