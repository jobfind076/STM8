#ifndef DRIVER_WS2812_H
#define DRIVER_WS2812_H

#define WIDTH ((uint8_t)8)
#define HEIGHT ((uint8_t)8)
#define NB_LEDS ((uint8_t)(WIDTH * HEIGHT))

// Decoding stream for SPI equivalent to WS2812's 1 and 0
#define WS_1 0x7C //((uint8_t)0b01111100)
#define WS_0 0x70 //((uint8_t)0b01110000)

// RGB structure 3 x 8 unsigned bits
typedef struct _RGB
{
	uint8_t r;
	uint8_t g;
	uint8_t b;
} RGB;

//#define COLOR_BLACK uint32_t(0)

void WS2812_send_led_single (uint8_t r, uint8_t g, uint8_t b);
void WS2812_send_led_rgb_array (void);
void WS2812_clear (void);
void WS2812_wait_spi_sr (void);
void WS2812_plain_color_fill (uint8_t r, uint8_t g, uint8_t b);

// void get_color (uint8_t i_index, RGB* o_color);
// void set_color (uint8_t i_index, RGB* i_color);

void bytes_to_rgb (RGB* o_color, uint8_t i_r, uint8_t i_g, uint8_t i_b);
void uint32_to_rgb (RGB* o_color, uint32_t i_color);
void hsv_to_rgb (RGB* o_color, uint8_t i_h, uint8_t i_s, uint8_t i_v);

#endif // DRIVER_WS2812_H