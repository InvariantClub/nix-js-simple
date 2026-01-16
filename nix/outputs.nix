{ inputs, ... }:
with inputs; {
  perSystem =
    { lib
    , system
    , ...
    }:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.default = pkgs.buildNpmPackage {
        name = "vue-js-simple";
        src = lib.cleanSource ../.;
        version = "0.0.0";

        npmDeps = pkgs.importNpmLock { npmRoot = lib.cleanSource ../.; };

        npmConfigHook = pkgs.importNpmLock.npmConfigHook;

        buildPhase = ''
          npm run build
        '';

        installPhase = ''
          mkdir $out
          cp -r dist/* $out
        '';
      };

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
        ];
      };
    };
}
