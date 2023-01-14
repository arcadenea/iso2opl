TARGET=iso2opl


CFLAGS = -std=gnu99 -pedantic -I/usr/include -I/usr/local/include -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
#CFLAGS += -DDEBUG

ifeq ($(_WIN32),1)
	CFLAGS += -D_WIN32
endif

OBJS = isofs.o \
iso2opl.o

all: $(TARGET)

rm-elf:
	-rm -f $(TARGET) $(OBJS)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJS) $(TARGET)

