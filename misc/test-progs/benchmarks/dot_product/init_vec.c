#include <stdint.h>
#define N 64
extern float a[N];
extern float b[N];

void vectorGen()
{
  int i;
  
  for (i = 0; i < N; i += 4) {
    float ti = (float) i;
    a[i] = ti;
    a[i+1] = ti+1;
    a[i+2] = ti+2;
    a[i+3] = ti+3;
    b[i] = ti;
    b[i+1] = ti+1;
    b[i+2] = ti+2;
    b[i+3] = ti+3;
  }
}
