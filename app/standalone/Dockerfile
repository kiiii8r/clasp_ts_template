FROM node:18

WORKDIR /usr/src/app

# package.jsonをコピーして依存関係をインストール
COPY package.json .
RUN npm install && npm install --save-dev @google/clasp typescript esbuild

# claspをグローバルにインストール
RUN npm install -g @google/clasp

# アプリケーションの残りをコピー
COPY . .

# TypeScriptの設定を生成
# TypeScriptの設定を生成
RUN npx tsc --init --outdir ./dist --rootdir ./src

RUN npm init -y && \
    npm pkg set scripts.build="esbuild src/*.ts --bundle --outdir=dist --format=iife"

# .clasp.jsonを生成
RUN echo '{ "scriptId": "", "rootDir": "./dist" }' > .clasp.json

# コンテナを実行し続けるためのコマンド
CMD ["tail", "-f", "/dev/null"]