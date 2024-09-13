{
  description = "The base nix flake.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { nixpkgs, ... }@inputs: let
    systems = [ "x86_64-linux" "aarch64-linux" ];
    eachSystem = nixpkgs.lib.genAttrs systems;
    withPkgs = system: import nixpkgs {
      system = system;
      config.allowUnfree = true;
      config.android_sdk.accept_license = true;
    };
  in {
    devShells = eachSystem (system: let
      pkgs = withPkgs system;
      jdk = pkgs.temurin-bin-21;
      androidtools = pkgs.androidenv.composeAndroidPackages {
        cmdLineToolsVersion = "13.0";
        platformToolsVersion = "35.0.1";
        buildToolsVersions = [ "34.0.0" ];
        platformVersions = [ "32" "33" "34" ];
        emulatorVersion = "35.1.4";
        includeSources = true;
        includeSystemImages = false;
        abiVersions = [ "arm64-v8a" ];
        useGoogleAPIs = false;
        useGoogleTVAddOns = false;
      };
    in { 
      default = pkgs.mkShell {
        packages = [
          jdk
          # androidtools.androidsdk
          pkgs.flutter
          pkgs.gradle
        ];
        # shellHook = ''
        #   echo ${androidtools.androidsdk}
        # '';
        # ${pkgs.flutter} config --android-sdk=${androidtools.androidsdk}
        # flutter config --android-sdk=${androidtools.androidsdk}
        # ANDROID_HOME = "${androidtools.androidsdk}/bin";
        # ANDROID_SDK_ROOT = "${androidtools.androidsdk}/bin";
        JAVA_HOME = jdk.home;
      };
    });
  };
}
