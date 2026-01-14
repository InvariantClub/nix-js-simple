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

Or, via Nix

``` sh
nix build .#
```

Then, in the directory `./result/` you will find the artifacts.

#### Formatting

``` sh
nix fmt
```

## How to use/extend this

Almost everything will be managed by `npm`.

If you add new npm dependencies, you will need to update the hash accordingly;
just run `nix build .#` and it will print out the new hash you need to set in
`./nix/outputs.nix` for the field `npmDepsHash`.
