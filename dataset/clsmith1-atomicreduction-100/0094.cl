// ---atomic_reductions ---fake_divergence -g 18,20,22 -l 6,20,2
#define int64_t long
#define uint64_t ulong
#define int_least64_t long
#define uint_least64_t ulong
#define int_fast64_t long
#define uint_fast64_t ulong
#define intmax_t long
#define uintmax_t ulong
#define int32_t int
#define uint32_t uint
#define int16_t short
#define uint16_t ushort
#define int8_t char
#define uint8_t uchar

#define INT64_MIN LONG_MIN
#define INT64_MAX LONG_MAX
#define INT32_MIN INT_MIN
#define INT32_MAX INT_MAX
#define INT16_MIN SHRT_MIN
#define INT16_MAX SHRT_MAX
#define INT8_MIN CHAR_MIN
#define INT8_MAX CHAR_MAX
#define UINT64_MIN ULONG_MIN
#define UINT64_MAX ULONG_MAX
#define UINT32_MIN UINT_MIN
#define UINT32_MAX UINT_MAX
#define UINT16_MIN USHRT_MIN
#define UINT16_MAX USHRT_MAX
#define UINT8_MIN UCHAR_MIN
#define UINT8_MAX UCHAR_MAX

#define transparent_crc(X, Y, Z) transparent_crc_(&crc64_context, X, Y, Z)

#define VECTOR(X , Y) VECTOR_(X, Y)
#define VECTOR_(X, Y) X##Y

#ifndef NO_GROUP_DIVERGENCE
#define GROUP_DIVERGE(x, y) get_group_id(x)
#else
#define GROUP_DIVERGE(x, y) (y)
#endif

#ifndef NO_FAKE_DIVERGENCE
#define FAKE_DIVERGE(x, y, z) (x - y)
#else
#define FAKE_DIVERGE(x, y, z) (z)
#endif


// Seed: 94

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S1 {
    int32_t g_4[8];
    int32_t * volatile g_3;
    uint32_t v_collective;
    uint64_t global_0_offset;
    uint64_t global_1_offset;
    uint64_t global_2_offset;
    uint64_t local_0_offset;
    uint64_t local_1_offset;
    uint64_t local_2_offset;
    uint64_t group_0_offset;
    uint64_t group_1_offset;
    uint64_t group_2_offset;
    __local volatile uint32_t *l_atomic_reduction;
    __global volatile uint32_t *g_atomic_reduction;
};


/* --- FORWARD DECLARATIONS --- */
int64_t  func_1(struct S1 * p_6);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_6->g_3
 * writes: p_6->g_4
 */
int64_t  func_1(struct S1 * p_6)
{ /* block id: 4 */
    int8_t l_2 = (-10L);
    uint32_t l_5 = 4294967289UL;
    (*p_6->g_3) = l_2;
    return l_5;
}


__kernel void entry(__global ulong *result, __global volatile int *g_atomic_reduction, __global int *sequence_input) {
    int i;
    __local volatile uint32_t l_atomic_reduction[1];
    if (get_linear_local_id() == 0)
        for (i = 0; i < 1; i++)
            l_atomic_reduction[i] = 0;
    struct S1 c_7;
    struct S1* p_6 = &c_7;
    struct S1 c_8 = {
        {0L,0L,0L,0L,0L,0L,0L,0L}, // p_6->g_4
        &p_6->g_4[6], // p_6->g_3
        0, // p_6->v_collective
        sequence_input[get_global_id(0)], // p_6->global_0_offset
        sequence_input[get_global_id(1)], // p_6->global_1_offset
        sequence_input[get_global_id(2)], // p_6->global_2_offset
        sequence_input[get_local_id(0)], // p_6->local_0_offset
        sequence_input[get_local_id(1)], // p_6->local_1_offset
        sequence_input[get_local_id(2)], // p_6->local_2_offset
        sequence_input[get_group_id(0)], // p_6->group_0_offset
        sequence_input[get_group_id(1)], // p_6->group_1_offset
        sequence_input[get_group_id(2)], // p_6->group_2_offset
        l_atomic_reduction, // l_atomic_reduction
        g_atomic_reduction, // g_atomic_reduction
    };
    c_7 = c_8;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_6);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    for (i = 0; i < 8; i++)
    {
        transparent_crc(p_6->g_4[i], "p_6->g_4[i]", print_hash_value);

    }
    transparent_crc(p_6->v_collective, "p_6->v_collective", print_hash_value);
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}
