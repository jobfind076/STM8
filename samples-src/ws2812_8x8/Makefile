SDCC=sdcc
SDLD=sdld
CFLAGS=-lstm8 -mstm8 --opt-code-size --stack-auto --std-c99 --out-fmt-ihx -I ../stdlib/inc -I .
LDFLAGS=

TARGET = main.ihx

# Source files
SRCS = stm8s_gpio.c stm8s_clk.c stm8s_spi.c delay.c random.c math.c ws2812.c

OBJS = $(SRCS:.c=.rel)

.PHONY: all clean flash

all: $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET) $(TARGET:.hex=.ihx) *.lst *.map *.sym *.asm *.mem *.rst *.cdb *.lk *.rel

flash:
	../../stm8flash -c stlinkv2 -p s103f3 -w ./$(TARGET)

$(TARGET): $(OBJS)
	$(SDCC) $(CFLAGS) main.c $(OBJS) -o $(TARGET)

%.rel: %.c
	$(SDCC) -c $(CFLAGS) $(LDFLAGS) $<
