ASFLAGS+=-W
CFLAGS+=-O1 -masm=intel -fno-asynchronous-unwind-tables

.PHONY: clean debug profile

fibonacci: fibonacci.s

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^

clean:
		-rm fibonacci 
