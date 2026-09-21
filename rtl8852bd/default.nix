# RTL8852BD Bluetooth (Realtek 0bda:b853, rom_version 3 / "eco4").
#
# Stock linux-firmware only ships eco 1/2 patches for the RTL8852BU radio,
# so the chip initialises with BD_ADDR 00:00:00:00:00:00 and hci0 stays DOWN.
# The eco-4 firmware only exists inside Realtek's Windows driver (a BTNIC003
# container: rtl8852bd_mp_chip_new.dat). We repack it (extract-firmware.py)
# into rtl8852bd_eco4.bin and use a patched btrtl that can download it.
#
# Based on https://github.com/mihaits/rtl8852bd-bt-linux (GPL-2.0).
{ pkgs, ... }:
let
  rtl8852bd-firmware = pkgs.runCommandNoCC "rtl8852bd-eco4-firmware" { } ''
    mkdir -p $out/lib/firmware/rtl_bt
    cp ${./rtl8852bd_eco4.bin} $out/lib/firmware/rtl_bt/rtl8852bd_eco4.bin
  '';

  # Replace the in-tree btrtl with the eco4-capable copy (6.8 snapshot, with
  # API shims for 6.12+ / 6.14+ kernels). btusb keeps the same btrtl_* symbols.
  patchedKernel = pkgs.linuxPackages.kernel.overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      cp ${./btrtl.c} drivers/bluetooth/btrtl.c
      cp ${./btrtl.h} drivers/bluetooth/btrtl.h
      cp ${./hci_codec.h} drivers/bluetooth/hci_codec.h
    '';
  });
in {
  hardware.firmware = [ rtl8852bd-firmware ];

  boot.kernelPackages = pkgs.linuxKernel.packagesFor patchedKernel;
}