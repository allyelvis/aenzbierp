{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.flutter
    pkgs.androidStudio
    pkgs.git
    pkgs.cmake
    pkgs.openjdk
  ];

  # Optional: Define environment variables
  shellHook = ''
    export PATH=$PATH:${pkgs.flutter}/bin
    export ANDROID_HOME=${pkgs.androidSdk}/lib/android-sdk
    export PATH=$PATH:${ANDROID_HOME}/tools
    export PATH=$PATH:${ANDROID_HOME}/platform-tools
    export FLUTTER_ROOT=${pkgs.flutter}
  '';
}