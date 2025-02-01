''' git clone https://github.com/stefaneggenreich/nixconfig '''

export NIX_CONFIG="experimental-features = nix-command flakes"

sudo mount -o remount,size=10G,noatime /nix/.rw-store

sudo nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --write-efi-boot-entries --flake
'.#nixosvm' --disk main /dev/vda # FIXME replace with your hostname

export NIX_CONFIG="experimental-features = nix-command flakes"

sudo nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --flake '.#nixosvm' --disk main
/dev/vda # FIXME replace with your hostname

sudo nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --flake
'github:stefaneggenreich/nixconfig/latest#nixosvm' --disk main /dev/vda
