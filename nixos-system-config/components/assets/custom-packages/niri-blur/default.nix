{ lib
, cairo
, dbus
, libGL
, libdisplay-info
, libinput
, seatd
, libxkbcommon
, libgbm
, pango
, pipewire
, pkg-config
, rustPlatform
, systemd
, wayland
, installShellFiles
, withDbus ? true
, withSystemd ? true
, withScreencastSupport ? true
, withDinit ? false
}:

rustPlatform.buildRustPackage rec {
  pname = "niri";
  version = "unstable";

  src = ./.;

  nativeBuildInputs = [
    rustPlatform.bindgenHook
    pkg-config
    installShellFiles
  ];

  buildInputs = [
    cairo dbus libGL libdisplay-info libinput seatd libxkbcommon libgbm pango wayland
  ] ++ lib.optional (withDbus || withScreencastSupport || withSystemd) dbus
    ++ lib.optional withScreencastSupport pipewire
    ++ lib.optional withSystemd systemd;

  # Add the rest of your build/install steps...
}
