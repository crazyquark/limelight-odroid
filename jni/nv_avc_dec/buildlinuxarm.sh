rm *.o libnv_avc_dec.so
gcc -I /usr/lib/jvm/java-7-openjdk-armhf/include/ -I /usr/local/include -I ./inc -fPIC -L/usr/local/lib -L. -c *.c
gcc -shared -Wl,-soname,libnv_avc_dec.so -Wl,--no-undefined -o libnv_avc_dec.so *.o -L/usr/local/lib -L. -lavcodec -lavfilter -lavformat -lavutil -lavresample -lswscale
rm *.o

