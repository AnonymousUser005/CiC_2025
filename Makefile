CC = g++
CFLAGS = -I. -I./blake3/ -static
CONFIG = -std=c++17 -msse2 -msse -mssse3 -march=native -ffast-math -mavx2 -mfma -maes -lcryptopp -lpthread -lgmpxx -lssl -lhiredis -lredis++ -lcrypto -lntl -lgmp -lm -lrt -fpermissive -fopenmp -Wl,./blake3/libblake3.so,-rpath,/sealusers/user3/redis-plus-plus/build
LD = g++
LDFLAGS = #-pg -no-pie
LIBS = #-lm


setup:  rawdatautil.cpp  bloom_filter.cpp AES_256GCM.c ./falcon-round3/Extra/c/shake.c ./falcon-round3/Extra/c/common.c ./falcon-round3/Extra/c/keygen.c ./falcon-round3/Extra/c/fft.c ./falcon-round3/Extra/c/fpr.c  ./falcon-round3/Extra/c/vrfy.c ./falcon-round3/Extra/c/codec.c ./falcon-round3/Extra/c/sign.c ./falcon-round3/Extra/c/rng.c setup.cpp 
	$(CC) -g -o setup  rawdatautil.cpp  bloom_filter.cpp AES_256GCM.c ./falcon-round3/Extra/c/shake.c ./falcon-round3/Extra/c/common.c ./falcon-round3/Extra/c/keygen.c ./falcon-round3/Extra/c/fft.c ./falcon-round3/Extra/c/fpr.c ./falcon-round3/Extra/c/vrfy.c ./falcon-round3/Extra/c/codec.c ./falcon-round3/Extra/c/sign.c ./falcon-round3/Extra/c/rng.c ./blake3/blake_hash.cpp setup.cpp  $(CONFIG)


search:  rawdatautil.cpp  bloom_filter.cpp AES_256GCM.c ./falcon-round3/Extra/c/shake.c ./falcon-round3/Extra/c/common.c ./falcon-round3/Extra/c/keygen.c ./falcon-round3/Extra/c/fft.c ./falcon-round3/Extra/c/fpr.c  ./falcon-round3/Extra/c/vrfy.c ./falcon-round3/Extra/c/codec.c ./falcon-round3/Extra/c/sign.c ./falcon-round3/Extra/c/rng.c search.cpp 
	$(CC) -g -o search  rawdatautil.cpp  bloom_filter.cpp AES_256GCM.c ./falcon-round3/Extra/c/shake.c ./falcon-round3/Extra/c/common.c ./falcon-round3/Extra/c/keygen.c ./falcon-round3/Extra/c/fft.c ./falcon-round3/Extra/c/fpr.c ./falcon-round3/Extra/c/vrfy.c ./falcon-round3/Extra/c/codec.c ./falcon-round3/Extra/c/sign.c ./falcon-round3/Extra/c/rng.c ./blake3/blake_hash.cpp search.cpp  $(CONFIG)



clean_all:
	rm -rf *.o setup *.gch setup search EDB_test.csv bloom_filter.dat
	@redis-cli flushall
	@redis-cli save

