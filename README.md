# pripa

Project: rest in peace, Amezo

## 概要

Riot.jsでNode.jsでGPL-3.0なスレッドフロート型掲示板です。  
Node.jsが動作する環境が必要です。  
デフォルトのRDBはMariaDBですが、少しの修正で他のRDBでも動作すると思います。  
[実動環境](http://aliceriverpark.pw/pripa/)は[h2o](https://h2o.examp1e.net)をリバースプロキシとしていますが、動作させるだけなら特に必須ではありません。  

## Description

This is a thread float type bulletin board with GPL-3.0 license using Riot.js and Node.js.

## Demo

[Production environment](http://aliceriverpark.pw/pripa/)

## Requirement

We need environment to run Node.js.
Although the default RDB is MariaDB, I think that it will work with other RDB with a little fix.

[Production environment] (http://aliceriverpark.pw/pripa/) uses [h2o] (https://h2o.examp1e.net) as a reverse proxy, but it is not particularly mandatory only to make it work.

## Usage

#### Create new bulletin board

    node bin/create_board {bulletin board name} // a new bulletin board record is created  
    cp test.html {bulletin board name}.html // test.html as a template and design a new bulletin board

#### Posting, thread creation, search

I think that it will understand.

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
