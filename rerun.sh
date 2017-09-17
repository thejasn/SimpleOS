rm *.o >> op;
rm -r isodir >> op;
rm myos.* >> op;
i686-elf-as boot.s -o boot.o >> op;
i686-elf-g++ -c kernel.cpp -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti >> op;
i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc >> op;
mkdir -p isodir/boot/grub >>op;
cp myos.bin isodir/boot/myos.bin >> op;
cp grub.cfg isodir/boot/grub/grub.cfg >> op;
grub-mkrescue -o myos.iso isodir >> op;

