sudo nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --write-efi-boot-entries --flake
'.#nixosvm' --disk main /dev/vda # FIXME replace with your hostname

export NIX_CONFIG="experimental-features = nix-command flakes"

sudo nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --flake '.#nixosvm' --disk main
/dev/vda # FIXME replace with your hostname

''' git clone https://github.com/stefaneggenreich/nixconfig '''

sudo -i

export NIX_CONFIG="experimental-features = nix-command flakes"

# size has to be ~ size of available ram? is that true?

mount -o remount,size=10G,noatime /nix/.rw-store

nix run 'github:nix-community/disko/latest#disko-install'
--experimental-features 'nix-command flakes' -- --flake
'github:stefaneggenreich/nixconfig#nixosvm' --disk main /dev/vda
