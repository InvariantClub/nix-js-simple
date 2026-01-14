# nix-js-simple

An extremely minimal flake.nix for a npm/node-based project. The code here is
a simple 'vue' starter project; but the main point is that the flake.nix
provides the `node` and `npm` executables; everything else is left to the npm
package manager.

## What's possible

#### Running the development server

``` sh
npm run dev
```

#### Building for production

``` sh
npm run build
```

#### Formatting

``` sh
nix fmt
```

## How to use/extend this

Almost everything will be managed by `npm`.
