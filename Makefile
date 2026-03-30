run: install
	qemu-system-x86_64 --bios bootloader/ovmf/OVMF.fd -drive file=fat:rw:bootimg/,format=raw

install: build
	mkdir -p ./bootimg/EFI/BOOT
	cp ./bootloader/target/x86_64-unknown-uefi/debug/bootloader.efi ./bootimg/EFI/BOOT/BOOTx64.efi

build: build-bootloader

build-bootloader:
	cd bootloader && cargo build