# coding: utf-8
module ProductDecorator
  def display_price
    # helperにいる
    number_to_currency(price, unit: '￥', precision: 0)
  end
end
