#language: ja
フィーチャ: 管理用のページから商品データを登録できること

  背景:
    前提 商品管理ページを開いている

  シナリオ: 商品データを新規に登録できる
    前提 "New Product"リンクをクリックする
    もし 以下の内容で商品を登録する:
      | 商品名 | 説明 | 価格 |
      | テスト用の商品 | てすとです | 1000      |
    ならば "テスト用の商品"の商品詳細ページが作成されていること
    かつ 説明が"てすとです"となっていること
    かつ 価格が"￥1,000"となっていること

