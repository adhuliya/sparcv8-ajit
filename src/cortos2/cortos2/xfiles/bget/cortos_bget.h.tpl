
#ifndef CORTOS_BGET_H
#define CORTOS_BGET_H

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_bget_declarations
////////////////////////////////////////////////////////////////////////////////
typedef long cortos_bufsize;

% if confObj.software.bget.enable:

// get/allocate a memory of `size` bytes
// Note: Some internal space may be wasted to make size align to 2^3 boundary.
void *cortos_bget(cortos_bufsize size);

// release/free an allocated memory chunk
void cortos_brel(void *buf);

% else:

// No cacheable heap and bget support added.

% end

% if confObj.hardware.memory.ncram[0].getSizeInBytes():

// get/allocate a memory of `size` bytes from NCRAM region
// Note: Some internal space may be wasted to make size align to 2^3 boundary.
void *cortos_bget_ncram(cortos_bufsize size);

// release/free an allocated memory chunk
void cortos_brel_ncram(void *buf);

% else:

// No non-cacheable heap and bget support added.

% end
////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_bget_declarations
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// BLOCK START: cortos_bget_declarations_internal
////////////////////////////////////////////////////////////////////////////////

// This function is called only once by CoRTOS.
void __cortos_bpool(void);

// This function is called only once by CoRTOS.
void __cortos_bpool_ncram(void);

////////////////////////////////////////////////////////////////////////////////
// BLOCK END  : cortos_bget_declarations_internal
////////////////////////////////////////////////////////////////////////////////

#endif // CORTOS_BGET_H

