# advanced_research_resume

徳山高専専攻科応用研究のレジュメ用TeXクラスファイル`advanced.cls`．

## このクラスファイルについて

* このクラスファイルは徳山高専専攻科応用研究のレジュメのTeX形式のテンプレートです．
* 明石高専専攻科特別研究の年報用TeXクラスファイル[format_nenpo](https://github.com/codeforkosen/format_nenpo)をベースにしています．
* クラスファイルの内部で`jsarticle.cls`を読み込んでいるので，普通に[TeX Live](https://texwiki.texjp.org/?TeX%20Live)とかで環境構築していれば動くと思います．

## ダウンロード方法

Gitを使う場合は以下のコマンドを実行することで，ローカルにcloneできます．

```bash
$ git clone http://kogataka13.tu.tokuyama.ac.jp:8000/i11murasige/advanced_research_resume.git
```

Gitを使わない場合は手動でzip形式等でダウンロードしてください．

## テンプレートの使い方

`resume.tex`を編集してください．

## コンパイル方法

makeを使える環境では下記のコマンドでコンパイルしてください．

```bash
$ make
```

その他の環境では以下のコマンドでコンパイルしてください．
図表や式の番号の参照がある場合は`platex`の実行回数を適宜変更してください．

```bash
$ platex resume.tex
$ dvipdfmx resume.dvi
```
