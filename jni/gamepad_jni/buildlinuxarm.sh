rm *.o libgamepad_jni.so
gcc -I /usr/lib/jvm/java-7-openjdk-armhf/include/ -fPIC -c *.c
gcc -shared -Wl,-soname,libgamepad_jni.so -Wl,--no-undefined -o libgamepad_jni.so *.o -L./linarm -lstem_gamepad -lpthread
rm *.o

