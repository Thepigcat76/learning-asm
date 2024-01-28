nasm -f elf64 -o build/main.o src/ex1.asm
ld -s -o build/main build/main.o
rm build/main.o
./build/main