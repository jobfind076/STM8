#include "random.h"

// Seed for the random number generator
static volatile uint16_t g_seed = 0;

// A simple pseudo-random number generator
uint16_t rand(void)
{
  g_seed = (g_seed * 1103515245 + 12345) & 0xFFFF; // A common LCG formula
  return g_seed;
}

// --- In your main program ---
// Initialize seed with a unique value (e.g., from a timer)
void init_rand(uint16_t value)
{
  g_seed = value;
}

// Get a random number between 0 and 255
uint8_t rand_byte(void)
{
  return rand() & 0xFF;
}

uint16_t random(uint16_t min_v, uint16_t max_v)
{
  uint16_t v = (min_v + rand()) % max_v;

  if (v < min_v)
  {
    v = min_v;
  }

  return v;
}
