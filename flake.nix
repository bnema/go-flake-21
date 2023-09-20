{
  description = "A flake for Go 1.21.1 linux-amd64";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      go1_21_1 = nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation rec {
        pname = "go";
        version = "1.21.1";

        src = nixpkgs.legacyPackages.x86_64-linux.fetchurl {
          url = "https://go.dev/dl/go${version}.linux-amd64.tar.gz";
          sha256 = "b3075ae1ce5dab85f89bc7905d1632de23ca196bd8336afd93fa97434cfa55ae";
        };

        phases = [ "unpackPhase" "installPhase" ];

        installPhase = ''
          mkdir -p $out
          cp -r ./* $out/
        '';

        meta = with nixpkgs.legacyPackages.x86_64-linux.lib; {
          description = "Go programming language compiler, linker, stdlib";
          license = licenses.bsd3;
        };
      };
    };
  };
}
