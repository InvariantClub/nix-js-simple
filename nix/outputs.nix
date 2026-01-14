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
        npmDepsHash = "sha256-XxE8UVGumqhv4xf0g+8T93ROsDOxhTDX23cNxaTXo1w=";

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
