// ---fake_divergence -g 23,12,1 -l 1,3,1
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


// Seed: 36

#include "CLSmith.h"

/* --- Struct/Union Declarations --- */
struct S1 {
    uint8_t g_2[8][3][6];
    uint64_t global_0_offset;
    uint64_t global_1_offset;
    uint64_t global_2_offset;
    uint64_t local_0_offset;
    uint64_t local_1_offset;
    uint64_t local_2_offset;
    uint64_t group_0_offset;
    uint64_t group_1_offset;
    uint64_t group_2_offset;
};


/* --- FORWARD DECLARATIONS --- */
uint32_t  func_1(struct S1 * p_3);


/* --- FUNCTIONS --- */
/* ------------------------------------------ */
/* 
 * reads : p_3->g_2
 * writes:
 */
uint32_t  func_1(struct S1 * p_3)
{ /* block id: 4 */
    return p_3->g_2[4][1][5];
}


__kernel void entry(__global ulong *result, __global int *sequence_input) {
    int i, j, k;
    struct S1 c_4;
    struct S1* p_3 = &c_4;
    struct S1 c_5 = {
        {{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}},{{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL},{0x2FL,5UL,5UL,0x22L,0xF5L,255UL}}}, // p_3->g_2
        sequence_input[get_global_id(0)], // p_3->global_0_offset
        sequence_input[get_global_id(1)], // p_3->global_1_offset
        sequence_input[get_global_id(2)], // p_3->global_2_offset
        sequence_input[get_local_id(0)], // p_3->local_0_offset
        sequence_input[get_local_id(1)], // p_3->local_1_offset
        sequence_input[get_local_id(2)], // p_3->local_2_offset
        sequence_input[get_group_id(0)], // p_3->group_0_offset
        sequence_input[get_group_id(1)], // p_3->group_1_offset
        sequence_input[get_group_id(2)], // p_3->group_2_offset
    };
    c_4 = c_5;
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    func_1(p_3);
    barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    uint64_t crc64_context = 0xFFFFFFFFFFFFFFFFUL;
    int print_hash_value = 0;
    for (i = 0; i < 8; i++)
    {
        for (j = 0; j < 3; j++)
        {
            for (k = 0; k < 6; k++)
            {
                transparent_crc(p_3->g_2[i][j][k], "p_3->g_2[i][j][k]", print_hash_value);

            }
        }
    }
    result[get_linear_global_id()] = crc64_context ^ 0xFFFFFFFFFFFFFFFFUL;
}
