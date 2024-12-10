# clasp_ts_template

このプロジェクトは、Google Apps Script（GAS）の開発をclasp、esbuild、typescriptを使用して行うためのテンプレートです。
さらに、jestとeslintを使用してテストとリントを行います。
以下の手順に従って、プロジェクトをセットアップおよび操作することができます。

## セットアップ

1. リポジトリをクローンします。
    ```sh
    git clone <リポジトリURL>
    cd spreadsheet-project
    ```

2. 必要なパッケージをインストールします。
    ```sh
    npm install
    ```

3. `.clasp.json`ファイルに`scriptId`を記入します。

4. Makefileの`<リポジトリ名>`を適切な名前に書き換えます。

5. Dockerイメージをビルドします。
    ```sh
    docker build -t spreadsheet-project .
    ```

6. Dockerコンテナを停止します。
    ```sh
    docker compose down
    ```
