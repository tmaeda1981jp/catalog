# -*- coding: utf-8 -*-

class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :image_cache, :recommend
  mount_uploader :image, ProductImageUploader

  validates_presence_of :name, :description

  # 以下どちらでも良い．下の書き方の方がモダン？ 
  # validates_numericality_of :price, :greater_than_or_equal_to => 0, :only_integer => true
  validates_numericality_of :price, greater_than_or_equal_to: 0, only_integer: true
  validates_uniqueness_of :name
  validate :price_must_be_a_multiple_of_hundreds

  scope :recommend, where(recommend, true)
  
  private
  def price_must_be_a_multiple_of_hundreds
    unless price % 100 == 0
      errors.add :price, "must be a multiple of hundreds"
    end
  end
end
