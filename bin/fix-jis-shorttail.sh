#!/bin/sh

find `dirname "$0"`/../docs-xml \
  -type f \
  '(' -name "*.xml" -o -name "*.xsl" -o -name "*.entities" ')' \
  -exec perl -pi -e '
    s/(
      アダプタ|
      アドミニストレータ|
      インストーラ|
      エクスプローラ|
      エディタ|
      #エントリ|
      オーバ|
      オブザーバ|
      カウンタ|
      カテゴリ|
      キャラクタ|
      ギャラリ|
      クラスタ|
      コネクタ|
      コンテナ|
      コントローラ|
      コンバータ|
      コンピュータ|
      サーバ|
      スキャナ|
      スライダ|
      セパレータ|
      デバッガ|
      デベロッパ|
      ドライバ|
      ナビゲータ|
      ハンドラ|
      バッファ|
      パラメータ|
      ビューア|
      フィルタ|
      フォルダ|
      フッタ|
      ブラウザ|
      #プライマリ|
      プリンタ|
      プレースホルダ|
      プロシージャ|
      プロジェクタ|
      プロバイダ|
      ヘッダ|
      ベクタ|
      ベンダ|
      ページャ|
      ポインタ|
      マスタ|
      #マネージャ|
      メンバ|
      モニタ|
      ユーザ|
      リゾルバ|
      リンカ|
      ローダ
    )/$1ー/gx;
    s/ーー/ー/g;
    s/(ローダ)ー(ブル)/$1$2/gx;
    s/(フィルタ)ー(リング)/$1$2/gx;
    ' \
  '{}' \
  '+' \
  ;

