#ifndef RANDOM_LIB
#define RANDOM_LIB

#include "stm8s.h"

// A simple pseudo-random number generator
uint16_t rand(void); 

// Initialize seed with a unique value (e.g., from a timer)
void init_rand(uint16_t value); 

// Get a random number between 0 and 255
uint8_t rand_byte(void); 

// Get random between min and max values
uint16_t random(uint16_t min_v, uint16_t max_v);

#endif /* RANDOM_LIB */

