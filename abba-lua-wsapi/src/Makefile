


all: src/fastcgi/lfcgi.so
	@echo 'MyPackages FAST ...'

src/fastcgi/lfcgi.so: src/fastcgi/lfcgi.h
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIB_OPTION) -o src/fastcgi/lfcgi.so src/fastcgi/lfcgi.c -lfcgi $(INC)

clean:
	@rm -f src/fastcgi/lfcgi.so
	@echo "Cleaning is done!"
