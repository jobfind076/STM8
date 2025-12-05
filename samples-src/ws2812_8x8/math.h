#ifndef MATH_LIB
#define MATH_LIB

#include "stm8s.h"

#define abs(x) ((x) > 0 ? (x) : -(x))
#define trunc(x) ((uint16_t)x)

float fmod (float a, float b);


#endif /* MATH_LIB */