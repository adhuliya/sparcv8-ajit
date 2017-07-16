
#include <stdint.h>

#ifdef AJIT
inline void put_g1(uint32_t val)
{
	__asm__ __volatile__("mov %0, %%g1\n\t" : :"r"(val));
}
inline void put_g2(uint32_t val)
{
	__asm__ __volatile__("mov %0, %%g2\n\t" : :"r"(val));
}
inline void put_g3(uint32_t val)
{
	__asm__ __volatile__("mov %0, %%g3\n\t" : :"r"(val));
}
inline void put_g4(uint32_t val)
{
	__asm__ __volatile__("mov %0, %%g4\n\t" : :"r"(val));
}
inline void put_g5(uint32_t val)
{
	__asm__ __volatile__("mov %0, %%g5\n\t" : :"r"(val));
}
inline void halt()
{
	__asm__ __volatile__("ta 0; nop; nop;");
}
#endif

#define N 64 

float a[N];
float b[N];

void vectorGen();

#ifndef AJIT
#include <stdio.h>
#endif

void run_test (void)
{

    vectorGen();
    float S0 = 0.0;
    float S1 = 0.0;
    float S2 = 0.0;
    float S3 = 0.0;
    int i; 
    for (i = 0; i < N; i += 8) {
	float B0 = a[i]*b[i];
	float B1 = a[i+1]*b[i+1];
	float B2 = a[i+2]*b[i+2];
	float B3 = a[i+3]*b[i+3];
	float B4 = a[i+4]*b[i+4];
	float B5 = a[i+5]*b[i+5];
	float B6 = a[i+6]*b[i+6];
	float B7 = a[i+7]*b[i+7];
	S0 += B0 + B1;
	S1 += B2 + B3;
	S2 += B4 + B5;
	S3 += B6 + B7;
    }
    float B = S0 + S1 + S2 + S3;
    void* pB = (void*) &B;
    uint32_t uB = *((uint32_t*) pB);
#ifndef AJIT
    printf("%f 0x%x\n", B, uB);
#else
    put_g2(uB);
#endif
}


#ifdef AJIT
#define ASI_MMU_REGISTER                0x04
inline void store_word_mmureg(uint32_t value, uint32_t* addr)
{
        __asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r"(value), "r"(addr),
                             "i"(ASI_MMU_REGISTER) : "memory");
}


int ajit_main(void)
{	
	store_word_mmureg(0x100,(uint32_t*) 0x0);
	run_test();
	halt();
	return 0;
}
#else
int main (void)
{
  run_test();	
  return(1);
}
#endif
