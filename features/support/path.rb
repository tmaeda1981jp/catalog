# -*- coding: utf-8 -*-
def name_to_path(name)
  case name
  when '商品管理'
    '/products'
  when '店舗管理'
    '/shops'
  else
    raise StandardError
  end
end
