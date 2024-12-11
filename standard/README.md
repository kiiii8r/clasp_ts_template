# プロジェクト概要

このプロジェクトは、Google Apps Script (GAS) を TypeScript で開発し、esbuild を使用してビルドおよびデプロイするためのテンプレートです。clasp (Command Line Apps Script) を使用して、GAS プロジェクトをローカル環境で管理し、効率的に開発を進めることができます。

主な機能:
- TypeScript を使用したモダンな開発環境
- esbuild を使用した高速なビルドプロセス
- clasp を使用した簡単なデプロイメント
- コーディング規約に従ったコードの品質向上

このテンプレートを使用することで、Google Apps Script の開発をより効率的に行うことができます。


# TypeScriptのコード規約（仮）

TypeScriptでコードを書く際には、以下の規約に従うことを推奨します。
基本的には[Typescriptスタイルガイド（コーディング規約）](https://typescript-jp.gitbook.io/deep-dive/styleguide)に従ってください。

## 1. コーディングスタイル

- **インデント**: スペース4つを使用します。
- **セミコロン**: ステートメントの終わりにはセミコロンを付けます。
- **クォート**: 文字列にはシングルクォートを使用します。
- **行の長さ**: 1行は120文字以内に収めます。
- **ファイルの末尾**: ファイルの末尾には改行を入れます。


# claspの環境構築

Google Apps Scriptのプロジェクトをローカル環境で管理するために、clasp (Command Line Apps Script) を使用します。以下はclaspの環境構築手順です。

## 前提条件

- Node.jsがインストールされていること
- npm (Node Package Manager) がインストールされていること

## 手順

1. **claspのインストール**

   npmを使用してclaspをグローバルにインストールします。

   ```sh
   npm install -g @google/clasp
   ```

2. **Googleアカウントでログイン**

   claspを使用してGoogleアカウントにログインします。

   ```sh
   clasp login
   ```

3. **Google Apps Script のAPIを有効にする**

   以下のリンク先でGoogle Apps Script の API を有効にします。
   - [Google Apps Script API](https://script.google.com/home/usersettings)


# 既存のコードを使用する際の手順（clasp + TypeScript + esbuild）

## 前提条件

- clasp の環境構築が完了していること

## 手順
既存のコードを使用するためには、以下の手順に従ってください。

1. **プロジェクトのクローン**

    GitHubなどのリポジトリからプロジェクトをクローンします。

    ```sh
    git clone <リポジトリのURL>
    cd <プロジェクトのディレクトリ>
    ```

2. **依存関係のインストール**

   .clasp.json ファイルを修正します。（なければ作成）

   ```json
   {
     "scriptId": "対象のGASプロジェクトのIDを指定",
     "rootDir": "./dist"
   }
   ```

3. **TypeScriptのビルド**

    TypeScriptのコードをビルドしてJavaScriptに変換します。

    ```sh
    npm run deploy
    ```

    以下のようなメッセージが出力されたらyを押してエンターを押してください。
    この場合、スプシの拡張機能のマクロのインポートが解除されるので、都度再設定が必要です。

    ```sh
    ? Manifest file has been updated. Do you want to push and overwrite? Yes
    ```


4. **対象のプロジェクトを開く**

    claspを使用して、対象のGoogle Apps Scriptを開きます。

    ```sh
    npm run open
    ```


# 新規プロジェクトの環境構築（clasp + TypeScript + esbuild）

既存コードをコピペし手順３のscriptIdを修正でも転用可能です。
Google Apps Script のプロジェクトをローカルで TypeScript を使って開発するために、clasp に加え esbuild を使用します。これにより、モダンな JavaScript 機能を使いながら、効率的にプロジェクトを構築・管理できます。

## 前提条件

- clasp の環境構築が完了していること

## 手順


1. **プロジェクトの初期設定**

   プロジェクトのディレクトリを作成し、`npm init` で Node.js のプロジェクトとして初期化します。

   ```sh
   mkdir my-gas-project（任意のディレクトリ名）
   cd my-gas-project（作成したディレクトリに移動）
   npm init -y

1. **必要なパッケージのインストール**

   clasp、TypeScript、esbuild をインストールします。

   ```sh
   npm install
   ```

2. **TypeScript と esbuild の設定**

   TypeScript の設定ファイル tsconfig.json を作成し、以下の内容を追加します。

   ```sh
   npx tsc --init
   ```

   ```json:tsconfig.json
    {
    "compilerOptions": {
        "lib": ["esnext"],
        "experimentalDecorators": true
    }
    }
   ```

   また、esbuild 用のスクリプトを package.json に追加します。

   ```json
   "scripts": {
     "build": "esbuild src/main.ts --bundle --outfile=dist/main.js --platform=node",
     "push": "clasp push"
   }
   ```

3. **clasp でのプロジェクトのセットアップ**

   Google アカウントでログインし、clasp のプロジェクトを作成します。

   ```sh
   npx clasp create --type standalone
   ```

   .clasp.json ファイルを作成し、以下の内容を追加します。

   ```json
   {
     "scriptId": "--自動生成されたスクリプトID--（既存のGASプロジェクトのIDがあれば指定）",
     "rootDir": "./dist"
   }
   ```

4. **ソースコードの構成**

   src フォルダを作成し、その中に TypeScript ファイル（例: main.ts）を配置します。これが Google Apps Script のエントリーポイントとなります。またappsscript.json を dist フォルダに移行しておきます。

   ```json:appsscript.json
    {
    "timeZone": "Asia/Tokyo",
    "dependencies": {
    },
    "exceptionLogging": "STACKDRIVER",
    "runtimeVersion": "V8"
    }
   ```

   main.ts ファイルの内容は以下の通りです。

   ```typescript:main.ts
   import { sample } from "./sample";

   // GASから参照したい変数はglobalオブジェクトに渡してあげる必要がある
   (global as any).sample = sample;
   ```

   sample.ts ファイルの内容は以下の通りです。

   ```typescript:sample.ts
   export function sample() {
     console.log("---sample---");
   }
   ```

5. **ビルドとデプロイ**

   esbuild.js ファイルを作成し、以下の内容を追加します。

   ```javascript:esbuild.js
   import esbuild from "esbuild";
   import { GasPlugin } from "esbuild-gas-plugin";

   esbuild
     .build({
       entryPoints: ["./src/main.ts"],
       bundle: true,
       minify: true,
       outfile: "./dist/main.js",
       plugins: [GasPlugin],
     })
     .catch((e) => {
       console.error(e);
       process.exit(1);
     });
   ```

   package.json にビルドやデプロイ用のコマンドを追加します。

   ```json:package.json
   "scripts": {
     "build": "node esbuild.js",
     "push": "clasp push",
     "open": "clasp open", # GAS側のスクリプト画面をブラウザで開く
     "deploy": "npm run build && npm run push"
   }
   ```

   最後に実行確認を行います。

   ```sh
   npm run deploy
   npm run open
   ```

