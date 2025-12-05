#include "math.h"

float fmod (float a, float b)
{
	return (a - trunc(a / b) * b);
}
