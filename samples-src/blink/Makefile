SDCC=sdcc
SDLD=sdld
CFLAGS=-lstm8 -mstm8 --opt-code-size --out-fmt-ihx -I ../stdlib/inc -I . 
LDFLAGS=

TARGET = main.ihx

# Source files
SRCS = stm8s_gpio.c stm8s_clk.c delay.c

OBJS = $(SRCS:.c=.rel)

.PHONY: all clean flash

all: $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET) $(TARGET:.hex=.ihx) *.lst *.map *.sym *.asm *.mem *.rst *.cdb *.lk

flash:
	../../stm8flash -c stlinkv2 -p stm8s103f3 -w ./$(TARGET)

$(TARGET): $(OBJS)
	$(SDCC) $(CFLAGS) main.c $(OBJS) -o $(TARGET)	

%.rel: %.c
	$(SDCC) -c $(CFLAGS) $(LDFLAGS) $<
