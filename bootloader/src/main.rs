#![no_std]
#![no_main]

use core::{fmt::Write, panic::PanicInfo};

use uefi::prelude::*;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[entry]
fn uefi_main() -> Status {
    system::with_stdout(|stdout| stdout.write_str("HELLO I AM A BOOTLOADER.").unwrap());
    loop {}
}
