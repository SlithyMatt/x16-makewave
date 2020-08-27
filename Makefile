ALL_OBJS = $(patsubst %.asm,%.o,$(wildcard *.asm))
ALL_HDRS = $(wildcard *.inc) 

all: $(ALL_OBJS) $(ALL_HDRS)
	cl65 -t cx16 -o MAKEWAVE.PRG -m makewave.mmap $(ALL_OBJS)

%.o: %.asm
	ca65 -t cx16 -o $@ -l $(patsubst %.asm,%.list,$<) $<

clean:
	rm -f *.o
	rm -f *.PRG
	rm -f *.mmap
