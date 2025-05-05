# pkgs/programs/mandown.nix
{ lib, buildInputs, fetchFromGitHub, stdenv, go }:

stdenv.mkDerivation rec {
  pname = "mandown";
  version = "v0.1.0";  # Version anpassen

  src = fetchFromGitHub {
  owner = "Nemesis1042";
  repo = "mandown";
  rev = "master"; 
  sha256 = "1mrlw6q51gz0z6p1nlwzqpvp6cp6pnsm67ky5a2blqdw5nwgw416";
};


  nativeBuildInputs = [ go ];

  meta = with lib; {
    description = "Markdown-to-Man Page converter";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}

