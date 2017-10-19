# advanced_research_resume

徳山高専専攻科応用研究のレジュメ用TeXクラスファイル`advanced.cls`．

## このクラスファイルについて

* このクラスファイルは徳山高専専攻科応用研究のレジュメのTeX形式のテンプレートです．
* 明石高専専攻科特別研究の年報用TeXクラスファイル[format_nenpo](https://github.com/codeforkosen/format_nenpo)をベースにしています．
* クラスファイルの内部で`jsarticle.cls`を読み込んでいるので，普通に[TeX Live](https://texwiki.texjp.org/?TeX%20Live)とかで環境構築していれば動くと思います．

## ダウンロード方法

[Releases](https://github.com/eqs/advanced_research_resume/releases)から最新版のSource codeをダウンロードして下さい．

## テンプレートの使い方

* `advanced.cls`と`resume.tex`を同じディレクトリに突っ込んで，`resume.tex`を編集してください．
* ファイルの文字コードは自分の環境に合わせて適宜変更してください．

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

個人的にオススメなのは`latexmk`コマンドを使う方法です．
使い方は各自ググって下さい．

