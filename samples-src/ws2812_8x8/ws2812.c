#include "stm8s.h"
#include "stm8s_gpio.h"
#include "ws2812.h"
#include "delay.h"
#include "math.h"

#define CLI __asm cli __endasm;
#define SEI __asm sei __endasm;

static RGB g_leds_matrix[NB_LEDS];


void get_color (uint8_t i_index, RGB* o_color)
{
	o_color->b = g_leds_matrix[i_index % NB_LEDS].b;
	o_color->r = g_leds_matrix[i_index % NB_LEDS].r;
	o_color->g = g_leds_matrix[i_index % NB_LEDS].g;
}

void set_color (uint8_t i_index, RGB* i_color)
{
	g_leds_matrix[i_index % NB_LEDS].b = i_color->b;
	g_leds_matrix[i_index % NB_LEDS].r = i_color->r;
	g_leds_matrix[i_index % NB_LEDS].g = i_color->g;
}

void bytes_to_rgb (RGB* o_color, uint8_t i_r, uint8_t i_g, uint8_t i_b)
{
	o_color->r = i_r;
	o_color->g = i_g;
	o_color->b = i_b;
}

void uint32_to_rgb (RGB* o_color, uint32_t i_color)
{
	o_color->r = (i_color >> 16) & 0xFF;
	o_color->g = (i_color >> 8) & 0xFF;
	o_color->b = (i_color >> 0) & 0xFF;
}

void hsv_to_rgb (RGB* o_color, uint8_t i_h, uint8_t i_s, uint8_t i_v)
{
 	if ((i_h > 360) || (i_s > 100) || (i_v > 100))
	{
    o_color->r = 0;
    o_color->g = 0;
    o_color->b = 0;

    return; // err
  }

  float s = (float)i_s / 100.0;
  float v = (float)i_v / 100.0;
  float C = s * v;
  float X = C * (1 - abs(fmod(i_h / 60.0, 2.0) - 1));
  float m = v - C;
  float r, g, b;

	if ((i_h >= 0) && (i_h < 60))
	{
    r = C, g = X, b = 0;
  }
  else if(i_h >= 60 && i_h < 120)
	{
    r = X, g = C, b = 0;
  }
  else if(i_h >= 120 && i_h < 180)
	{
    r = 0, g = C, b = X;
  }
  else if(i_h >= 180 && i_h < 240)
	{
    r = 0, g = X, b = C;
  }
  else if(i_h >= 240 && i_h < 300)
	{
    r = X, g = 0, b = C;
  }
  else
	{
    r = C, g = 0, b = X;
  }

  o_color->r = (r + m) * 255;
  o_color->g = (g + m) * 255;
  o_color->b = (b + m) * 255;
}

// side function to wait for the SPI and avoid overflow
void WS2812_wait_spi_sr(void)
{
	while ((SPI->SR & (uint8_t)SPI_FLAG_TXE) == (uint8_t)RESET)
		;
}

// program only one LED
void WS2812_send_led_single(uint8_t r, uint8_t g, uint8_t b)
{
	//CLI

	SPI->DR = (g & (1 << 7)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 6)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 5)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 4)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 3)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 2)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & (1 << 1)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (g & 1) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();

	SPI->DR = (r & (1 << 7)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 6)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 5)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 4)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 3)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 2)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & (1 << 1)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (r & 1) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();

	SPI->DR = (b & (1 << 7)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 6)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 5)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 4)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 3)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 2)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & (1 << 1)) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();
	SPI->DR = (b & 1) ? WS_1 : WS_0;
	WS2812_wait_spi_sr();

	//SEI

	/* NO RET code here! This function is called multiple
	 * time for the entire LED strip/panel  */
}

// Send the full LED strip/panel value from RGB array
void WS2812_send_led_rgb_array()
{
	uint8_t i = 0;
	for (i = 0; i < NB_LEDS; i++)
	{
		WS2812_send_led_single(g_leds_matrix[i].r, g_leds_matrix[i].g, g_leds_matrix[i].b);
	}
	delay_10us(10); /* RET code 100us */
}

// switch off the LED strip/panel by sending all 0
void WS2812_clear()
{
	uint8_t i = 0;
	uint8_t j = 0;

	for (i = 0; i < NB_LEDS; i++)
	{
		for (j = 0; j < 24; j++)
		{
			SPI->DR = WS_0;
			while ((SPI->SR & (uint8_t)SPI_FLAG_TXE) == (uint8_t)RESET)
				;
		}
	}

	delay_10us(10); /* RET code 100 us */
}

// color fill
void WS2812_plain_color_fill(uint8_t r, uint8_t g, uint8_t b)
{
	for (uint8_t i = 0; i < NB_LEDS; i++)
	{
		WS2812_send_led_single(r, g, b);
	}

	delay_10us(10); /* RET code 100 us */
}
