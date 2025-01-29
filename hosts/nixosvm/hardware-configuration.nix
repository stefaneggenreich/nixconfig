{config, lib, pkgs, modulesPath, ... }:
# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{
  boot.loader.systemd-boot.enable = true;

  imports = [ (modulesPath + "/profiles/qemu-guest.nix")];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];


  networking.useDHCP = lib.mkDefault true;

  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
