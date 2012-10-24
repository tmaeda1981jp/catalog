# -*- coding: utf-8 -*-

前提 /^(.*?)ページを開いている$/ do |name|
  visit name_to_path(name)
end

前提 /^"(.*?)"リンクをクリックする$/ do |link_text|
  click_link link_text
end

もし /^以下の内容で商品を登録する:$/ do |table|
  product_info = table.hashes[0]
  fill_in 'product_name', with: product_info['商品名']
  fill_in 'product_description', with: product_info['説明']
  fill_in 'product_price', with: product_info['価格']
  click_on 'Save'
=begin
  table.hashes.each do |row|
    Product.create!(name: row['商品名'], description: row['説明'], price: row['価格'].to_i)
  end
=end
end

ならば /^"(.*?)"の商品詳細ページが作成されていること$/ do |product_name|
  # p url_for(Product.where(name: product_name).first)
  visit url_for(Product.where(name: product_name).first)
  within 'p.name' do
    page.should have_content(product_name)
  end
end

ならば /^説明が"(.*?)"となっていること$/ do |product_description|
  within 'div.description' do
    page.should have_content(product_description)
  end
end

ならば /^価格が"(.*?)"となっていること$/ do |product_price|
  within 'p.price' do
    page.should have_content(product_price)
  end
end

もし /^以下の内容で店舗データを登録する$/ do |table|
  shop_info = table.hashes[0]
  fill_in 'shop_name', with: shop_info['店舗名']
  fill_in 'shop_description', with: shop_info['紹介文']
  fill_in 'shop_lines_summary', with: shop_info['取扱商品概要']
  click_on 'Save'
end

ならば /^"(.*?)"の店舗詳細ページが作成されていること$/ do |shop_name|
  visit url_for(Shop.where(name: shop_name).first)
  within 'p.name' do
    page.should have_content(shop_name)
  end
end

ならば /^紹介文が"(.*?)"となっていること$/ do |shop_description|
  within 'div.description' do
    page.should have_content(shop_description)
  end
end

ならば /^取扱商品概要が"(.*?)"となっていること$/ do |shop_lines_summary|
  within 'p.lines_summary' do
    page.should have_content(shop_lines_summary)
  end
end

前提 /^以下の商品が登録されている:$/ do |table|
  table.hashes.each do |row|          
    Product.create!(name: row['商品名'], description: row['説明'], price: row['価格'].to_i)
  end
end

もし /^トップページを表示する$/ do
  visit '/'
end 

ならば /^以下の商品が表示されていること:$/ do |table|
  table.hashes.each do |row|
    page.should have_content(row['商品名'])
  end
end
