{
  description = "devshell for LaTeX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            #(texlive.combine {
            #  inherit (texlive) scheme-full; # or scheme-medium, scheme-small, etc.
            #})
            biber
            texliveFull
          ];

          shellHook = ''
            zsh
          '';
        };
      }
    );
}
