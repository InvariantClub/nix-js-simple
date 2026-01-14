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
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
        ];
      };
    };
}
