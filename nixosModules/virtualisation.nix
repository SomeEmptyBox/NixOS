{ pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  users.users.peace.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    #virtio-win
    #win-spice
  ];
  programs.virt-manager.enable = true;

  home-manager.users.peace = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
