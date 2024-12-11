FROM node:18

WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install && npm install --save-dev @google/clasp typescript esbuild eslint jest

# Install clasp globally
RUN npm install -g @google/clasp

# Copy the rest of the application
COPY . .

# Generate TypeScript configuration
RUN npx tsc --init --outdir ./dist --rootdir ./src

RUN npm init -y && \
    npm pkg set scripts.build="esbuild src/*.ts --bundle --outdir=dist --format=iife" && \
    npm pkg set scripts.lint="eslint src/**/*.ts" && \
    npm pkg set scripts.test="jest"

# .clasp.jsonを生成
RUN echo '{ "scriptId": "", "rootDir": "./dist" }' > .clasp.json

# Command to keep the container running
CMD ["tail", "-f", "/dev/null"]