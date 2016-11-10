# pripa

Project: rest in peace, Amezo

## Description

Riot.jsでNode.jsでGPL-3.0なスレッドフロート型掲示板です。

## Demo

[実動環境](http://aliceriverpark.pw/pripa/)

## Requirement

Node.jsが動作する環境が必要です。  
デフォルトのRDBはMariaDBですが、少しの修正で他のRDBでも動作すると思います。  
[実動環境](http://aliceriverpark.pw/pripa/)は[h2o](https://h2o.examp1e.net)をリバースプロキシとしていますが、動作させるだけなら特に必須ではありません。  

## Usage

#### 新規掲示板作成

    node bin/create_board {掲示板名} // 新規掲示板のレコードが作成される  
    cp test.html {掲示板名}.html // test.htmlを雛形として新規掲示板をデザインする

#### 投稿、スレッド作成、検索

見ればわかると思います。

## Install

    git clone
    cd pripa
    npm install
    npm install -g riot
    npm install -g uglify-js
    node bin/sync
    cd public/javascripts/tag
    ./compile.sh

## Contribution

1. Fork it ( http://github.com/arisugawakoen/pripa/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Licence
[GPL-3.0](http://www.gnu.org/licenses/gpl-3.0.txt)

## Author
[arisugawakoen](http://aliceriverpark.pw)
