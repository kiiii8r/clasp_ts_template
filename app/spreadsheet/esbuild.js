import * as esbuild from "esbuild";

esbuild
  .build({
    entryPoints: ["./src/main.ts"],
    bundle: true,
    minify: true,
    outfile: "./dist/main.js",
  })
  .catch(() => process.exit(1));
