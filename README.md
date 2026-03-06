# Lab 1
## Compile

cd lab1\

print_hello.s\
gcc -nostdlib -no-pie print_hello.s -o hello\
./hello

Task_1.s\
gcc -no-pie Task_1.s print_ram.c -o task1\
./task1\

Task_2.s\
gcc -no-pie Task_2.s print_ram.c -o task2\
./task2\

Task_3.s\
gcc -no-pie Task_3.s print_ram.c -o task3\
./task3\

Task_4.s\
gcc -no-pie Task_4.s print_ram.c -o task4\
./task4\

# Lab 2
## Compile

cd lab2\
gcc -no-pie lab2.s -o run\
./run\

# Lab 3
## Compile

cd lab3\
gcc lab3.c lab3.s -o run\
./run\

