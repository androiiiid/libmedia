# Copyright (c) 2011-2016, Andy Polyakov <appro@openssl.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
#     * Redistributions of source code must retain copyright notices,
#      this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials
#      provided with the distribution.
#
#     * Neither the name of the Andy Polyakov nor the names of its
#      copyright holder and contributors may be used to endorse or
#      promote products derived from this software without specific
#      prior written permission.
#
# ALTERNATIVELY, provided that this notice is retained in full, this
# product may be distributed under the terms of the GNU General Public
# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
# those given above.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *** This file is auto-generated ***
#
# 1 "lib/accelerated/aarch64/elf/sha1-armv8.s.tmp.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/accelerated/aarch64/elf/sha1-armv8.s.tmp.S"
# 1 "lib/accelerated/aarch64/aarch64-common.h" 1
# 2 "lib/accelerated/aarch64/elf/sha1-armv8.s.tmp.S" 2

.text


.globl sha1_block_data_order
.type sha1_block_data_order,%function
.align 6
sha1_block_data_order:



 ldr x16,.L_gnutls_arm_cpuid_s

 adr x17,.L_gnutls_arm_cpuid_s
 add x16,x16,x17
 ldr w16,[x16]
 tst w16,#(1<<3)
 b.ne .Lv8_entry

 stp x29,x30,[sp,#-96]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]

 ldp w20,w21,[x0]
 ldp w22,w23,[x0,#8]
 ldr w24,[x0,#16]

.Loop:
 ldr x3,[x1],#64
 movz w28,#0x7999
 sub x2,x2,#1
 movk w28,#0x5a82,lsl#16



 rev32 x3,x3

 add w24,w24,w28
 add w24,w24,w3
 lsr x4,x3,#32
 ldr x5,[x1,#-56]
 bic w25,w23,w21
 and w26,w22,w21
 ror w27,w20,#27
 add w23,w23,w28
 orr w25,w25,w26
 add w24,w24,w27
 ror w21,w21,#2
 add w23,w23,w4
 add w24,w24,w25



 rev32 x5,x5

 bic w25,w22,w20
 and w26,w21,w20
 ror w27,w24,#27
 add w22,w22,w28
 orr w25,w25,w26
 add w23,w23,w27
 ror w20,w20,#2
 add w22,w22,w5
 add w23,w23,w25
 lsr x6,x5,#32
 ldr x7,[x1,#-48]
 bic w25,w21,w24
 and w26,w20,w24
 ror w27,w23,#27
 add w21,w21,w28
 orr w25,w25,w26
 add w22,w22,w27
 ror w24,w24,#2
 add w21,w21,w6
 add w22,w22,w25



 rev32 x7,x7

 bic w25,w20,w23
 and w26,w24,w23
 ror w27,w22,#27
 add w20,w20,w28
 orr w25,w25,w26
 add w21,w21,w27
 ror w23,w23,#2
 add w20,w20,w7
 add w21,w21,w25
 lsr x8,x7,#32
 ldr x9,[x1,#-40]
 bic w25,w24,w22
 and w26,w23,w22
 ror w27,w21,#27
 add w24,w24,w28
 orr w25,w25,w26
 add w20,w20,w27
 ror w22,w22,#2
 add w24,w24,w8
 add w20,w20,w25



 rev32 x9,x9

 bic w25,w23,w21
 and w26,w22,w21
 ror w27,w20,#27
 add w23,w23,w28
 orr w25,w25,w26
 add w24,w24,w27
 ror w21,w21,#2
 add w23,w23,w9
 add w24,w24,w25
 lsr x10,x9,#32
 ldr x11,[x1,#-32]
 bic w25,w22,w20
 and w26,w21,w20
 ror w27,w24,#27
 add w22,w22,w28
 orr w25,w25,w26
 add w23,w23,w27
 ror w20,w20,#2
 add w22,w22,w10
 add w23,w23,w25



 rev32 x11,x11

 bic w25,w21,w24
 and w26,w20,w24
 ror w27,w23,#27
 add w21,w21,w28
 orr w25,w25,w26
 add w22,w22,w27
 ror w24,w24,#2
 add w21,w21,w11
 add w22,w22,w25
 lsr x12,x11,#32
 ldr x13,[x1,#-24]
 bic w25,w20,w23
 and w26,w24,w23
 ror w27,w22,#27
 add w20,w20,w28
 orr w25,w25,w26
 add w21,w21,w27
 ror w23,w23,#2
 add w20,w20,w12
 add w21,w21,w25



 rev32 x13,x13

 bic w25,w24,w22
 and w26,w23,w22
 ror w27,w21,#27
 add w24,w24,w28
 orr w25,w25,w26
 add w20,w20,w27
 ror w22,w22,#2
 add w24,w24,w13
 add w20,w20,w25
 lsr x14,x13,#32
 ldr x15,[x1,#-16]
 bic w25,w23,w21
 and w26,w22,w21
 ror w27,w20,#27
 add w23,w23,w28
 orr w25,w25,w26
 add w24,w24,w27
 ror w21,w21,#2
 add w23,w23,w14
 add w24,w24,w25



 rev32 x15,x15

 bic w25,w22,w20
 and w26,w21,w20
 ror w27,w24,#27
 add w22,w22,w28
 orr w25,w25,w26
 add w23,w23,w27
 ror w20,w20,#2
 add w22,w22,w15
 add w23,w23,w25
 lsr x16,x15,#32
 ldr x17,[x1,#-8]
 bic w25,w21,w24
 and w26,w20,w24
 ror w27,w23,#27
 add w21,w21,w28
 orr w25,w25,w26
 add w22,w22,w27
 ror w24,w24,#2
 add w21,w21,w16
 add w22,w22,w25



 rev32 x17,x17

 bic w25,w20,w23
 and w26,w24,w23
 ror w27,w22,#27
 add w20,w20,w28
 orr w25,w25,w26
 add w21,w21,w27
 ror w23,w23,#2
 add w20,w20,w17
 add w21,w21,w25
 lsr x19,x17,#32
 eor w3,w3,w5
 bic w25,w24,w22
 and w26,w23,w22
 ror w27,w21,#27
 eor w3,w3,w11
 add w24,w24,w28
 orr w25,w25,w26
 add w20,w20,w27
 eor w3,w3,w16
 ror w22,w22,#2
 add w24,w24,w19
 add w20,w20,w25
 ror w3,w3,#31
 eor w4,w4,w6
 bic w25,w23,w21
 and w26,w22,w21
 ror w27,w20,#27
 eor w4,w4,w12
 add w23,w23,w28
 orr w25,w25,w26
 add w24,w24,w27
 eor w4,w4,w17
 ror w21,w21,#2
 add w23,w23,w3
 add w24,w24,w25
 ror w4,w4,#31
 eor w5,w5,w7
 bic w25,w22,w20
 and w26,w21,w20
 ror w27,w24,#27
 eor w5,w5,w13
 add w22,w22,w28
 orr w25,w25,w26
 add w23,w23,w27
 eor w5,w5,w19
 ror w20,w20,#2
 add w22,w22,w4
 add w23,w23,w25
 ror w5,w5,#31
 eor w6,w6,w8
 bic w25,w21,w24
 and w26,w20,w24
 ror w27,w23,#27
 eor w6,w6,w14
 add w21,w21,w28
 orr w25,w25,w26
 add w22,w22,w27
 eor w6,w6,w3
 ror w24,w24,#2
 add w21,w21,w5
 add w22,w22,w25
 ror w6,w6,#31
 eor w7,w7,w9
 bic w25,w20,w23
 and w26,w24,w23
 ror w27,w22,#27
 eor w7,w7,w15
 add w20,w20,w28
 orr w25,w25,w26
 add w21,w21,w27
 eor w7,w7,w4
 ror w23,w23,#2
 add w20,w20,w6
 add w21,w21,w25
 ror w7,w7,#31
 movz w28,#0xeba1
 movk w28,#0x6ed9,lsl#16
 eor w8,w8,w10
 bic w25,w24,w22
 and w26,w23,w22
 ror w27,w21,#27
 eor w8,w8,w16
 add w24,w24,w28
 orr w25,w25,w26
 add w20,w20,w27
 eor w8,w8,w5
 ror w22,w22,#2
 add w24,w24,w7
 add w20,w20,w25
 ror w8,w8,#31
 eor w9,w9,w11
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w9,w9,w17
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w9,w9,w6
 add w23,w23,w8
 add w24,w24,w25
 ror w9,w9,#31
 eor w10,w10,w12
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w10,w10,w19
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w10,w10,w7
 add w22,w22,w9
 add w23,w23,w25
 ror w10,w10,#31
 eor w11,w11,w13
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w11,w11,w3
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w11,w11,w8
 add w21,w21,w10
 add w22,w22,w25
 ror w11,w11,#31
 eor w12,w12,w14
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w12,w12,w4
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w12,w12,w9
 add w20,w20,w11
 add w21,w21,w25
 ror w12,w12,#31
 eor w13,w13,w15
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w13,w13,w5
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w13,w13,w10
 add w24,w24,w12
 add w20,w20,w25
 ror w13,w13,#31
 eor w14,w14,w16
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w14,w14,w6
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w14,w14,w11
 add w23,w23,w13
 add w24,w24,w25
 ror w14,w14,#31
 eor w15,w15,w17
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w15,w15,w7
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w15,w15,w12
 add w22,w22,w14
 add w23,w23,w25
 ror w15,w15,#31
 eor w16,w16,w19
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w16,w16,w8
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w16,w16,w13
 add w21,w21,w15
 add w22,w22,w25
 ror w16,w16,#31
 eor w17,w17,w3
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w17,w17,w9
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w17,w17,w14
 add w20,w20,w16
 add w21,w21,w25
 ror w17,w17,#31
 eor w19,w19,w4
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w19,w19,w10
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w19,w19,w15
 add w24,w24,w17
 add w20,w20,w25
 ror w19,w19,#31
 eor w3,w3,w5
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w3,w3,w11
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w3,w3,w16
 add w23,w23,w19
 add w24,w24,w25
 ror w3,w3,#31
 eor w4,w4,w6
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w4,w4,w12
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w4,w4,w17
 add w22,w22,w3
 add w23,w23,w25
 ror w4,w4,#31
 eor w5,w5,w7
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w5,w5,w13
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w5,w5,w19
 add w21,w21,w4
 add w22,w22,w25
 ror w5,w5,#31
 eor w6,w6,w8
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w6,w6,w14
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w6,w6,w3
 add w20,w20,w5
 add w21,w21,w25
 ror w6,w6,#31
 eor w7,w7,w9
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w7,w7,w15
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w7,w7,w4
 add w24,w24,w6
 add w20,w20,w25
 ror w7,w7,#31
 eor w8,w8,w10
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w8,w8,w16
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w8,w8,w5
 add w23,w23,w7
 add w24,w24,w25
 ror w8,w8,#31
 eor w9,w9,w11
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w9,w9,w17
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w9,w9,w6
 add w22,w22,w8
 add w23,w23,w25
 ror w9,w9,#31
 eor w10,w10,w12
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w10,w10,w19
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w10,w10,w7
 add w21,w21,w9
 add w22,w22,w25
 ror w10,w10,#31
 eor w11,w11,w13
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w11,w11,w3
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w11,w11,w8
 add w20,w20,w10
 add w21,w21,w25
 ror w11,w11,#31
 movz w28,#0xbcdc
 movk w28,#0x8f1b,lsl#16
 eor w12,w12,w14
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w12,w12,w4
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w12,w12,w9
 add w24,w24,w11
 add w20,w20,w25
 ror w12,w12,#31
 orr w25,w21,w22
 and w26,w21,w22
 eor w13,w13,w15
 ror w27,w20,#27
 and w25,w25,w23
 add w23,w23,w28
 eor w13,w13,w5
 add w24,w24,w27
 orr w25,w25,w26
 ror w21,w21,#2
 eor w13,w13,w10
 add w23,w23,w12
 add w24,w24,w25
 ror w13,w13,#31
 orr w25,w20,w21
 and w26,w20,w21
 eor w14,w14,w16
 ror w27,w24,#27
 and w25,w25,w22
 add w22,w22,w28
 eor w14,w14,w6
 add w23,w23,w27
 orr w25,w25,w26
 ror w20,w20,#2
 eor w14,w14,w11
 add w22,w22,w13
 add w23,w23,w25
 ror w14,w14,#31
 orr w25,w24,w20
 and w26,w24,w20
 eor w15,w15,w17
 ror w27,w23,#27
 and w25,w25,w21
 add w21,w21,w28
 eor w15,w15,w7
 add w22,w22,w27
 orr w25,w25,w26
 ror w24,w24,#2
 eor w15,w15,w12
 add w21,w21,w14
 add w22,w22,w25
 ror w15,w15,#31
 orr w25,w23,w24
 and w26,w23,w24
 eor w16,w16,w19
 ror w27,w22,#27
 and w25,w25,w20
 add w20,w20,w28
 eor w16,w16,w8
 add w21,w21,w27
 orr w25,w25,w26
 ror w23,w23,#2
 eor w16,w16,w13
 add w20,w20,w15
 add w21,w21,w25
 ror w16,w16,#31
 orr w25,w22,w23
 and w26,w22,w23
 eor w17,w17,w3
 ror w27,w21,#27
 and w25,w25,w24
 add w24,w24,w28
 eor w17,w17,w9
 add w20,w20,w27
 orr w25,w25,w26
 ror w22,w22,#2
 eor w17,w17,w14
 add w24,w24,w16
 add w20,w20,w25
 ror w17,w17,#31
 orr w25,w21,w22
 and w26,w21,w22
 eor w19,w19,w4
 ror w27,w20,#27
 and w25,w25,w23
 add w23,w23,w28
 eor w19,w19,w10
 add w24,w24,w27
 orr w25,w25,w26
 ror w21,w21,#2
 eor w19,w19,w15
 add w23,w23,w17
 add w24,w24,w25
 ror w19,w19,#31
 orr w25,w20,w21
 and w26,w20,w21
 eor w3,w3,w5
 ror w27,w24,#27
 and w25,w25,w22
 add w22,w22,w28
 eor w3,w3,w11
 add w23,w23,w27
 orr w25,w25,w26
 ror w20,w20,#2
 eor w3,w3,w16
 add w22,w22,w19
 add w23,w23,w25
 ror w3,w3,#31
 orr w25,w24,w20
 and w26,w24,w20
 eor w4,w4,w6
 ror w27,w23,#27
 and w25,w25,w21
 add w21,w21,w28
 eor w4,w4,w12
 add w22,w22,w27
 orr w25,w25,w26
 ror w24,w24,#2
 eor w4,w4,w17
 add w21,w21,w3
 add w22,w22,w25
 ror w4,w4,#31
 orr w25,w23,w24
 and w26,w23,w24
 eor w5,w5,w7
 ror w27,w22,#27
 and w25,w25,w20
 add w20,w20,w28
 eor w5,w5,w13
 add w21,w21,w27
 orr w25,w25,w26
 ror w23,w23,#2
 eor w5,w5,w19
 add w20,w20,w4
 add w21,w21,w25
 ror w5,w5,#31
 orr w25,w22,w23
 and w26,w22,w23
 eor w6,w6,w8
 ror w27,w21,#27
 and w25,w25,w24
 add w24,w24,w28
 eor w6,w6,w14
 add w20,w20,w27
 orr w25,w25,w26
 ror w22,w22,#2
 eor w6,w6,w3
 add w24,w24,w5
 add w20,w20,w25
 ror w6,w6,#31
 orr w25,w21,w22
 and w26,w21,w22
 eor w7,w7,w9
 ror w27,w20,#27
 and w25,w25,w23
 add w23,w23,w28
 eor w7,w7,w15
 add w24,w24,w27
 orr w25,w25,w26
 ror w21,w21,#2
 eor w7,w7,w4
 add w23,w23,w6
 add w24,w24,w25
 ror w7,w7,#31
 orr w25,w20,w21
 and w26,w20,w21
 eor w8,w8,w10
 ror w27,w24,#27
 and w25,w25,w22
 add w22,w22,w28
 eor w8,w8,w16
 add w23,w23,w27
 orr w25,w25,w26
 ror w20,w20,#2
 eor w8,w8,w5
 add w22,w22,w7
 add w23,w23,w25
 ror w8,w8,#31
 orr w25,w24,w20
 and w26,w24,w20
 eor w9,w9,w11
 ror w27,w23,#27
 and w25,w25,w21
 add w21,w21,w28
 eor w9,w9,w17
 add w22,w22,w27
 orr w25,w25,w26
 ror w24,w24,#2
 eor w9,w9,w6
 add w21,w21,w8
 add w22,w22,w25
 ror w9,w9,#31
 orr w25,w23,w24
 and w26,w23,w24
 eor w10,w10,w12
 ror w27,w22,#27
 and w25,w25,w20
 add w20,w20,w28
 eor w10,w10,w19
 add w21,w21,w27
 orr w25,w25,w26
 ror w23,w23,#2
 eor w10,w10,w7
 add w20,w20,w9
 add w21,w21,w25
 ror w10,w10,#31
 orr w25,w22,w23
 and w26,w22,w23
 eor w11,w11,w13
 ror w27,w21,#27
 and w25,w25,w24
 add w24,w24,w28
 eor w11,w11,w3
 add w20,w20,w27
 orr w25,w25,w26
 ror w22,w22,#2
 eor w11,w11,w8
 add w24,w24,w10
 add w20,w20,w25
 ror w11,w11,#31
 orr w25,w21,w22
 and w26,w21,w22
 eor w12,w12,w14
 ror w27,w20,#27
 and w25,w25,w23
 add w23,w23,w28
 eor w12,w12,w4
 add w24,w24,w27
 orr w25,w25,w26
 ror w21,w21,#2
 eor w12,w12,w9
 add w23,w23,w11
 add w24,w24,w25
 ror w12,w12,#31
 orr w25,w20,w21
 and w26,w20,w21
 eor w13,w13,w15
 ror w27,w24,#27
 and w25,w25,w22
 add w22,w22,w28
 eor w13,w13,w5
 add w23,w23,w27
 orr w25,w25,w26
 ror w20,w20,#2
 eor w13,w13,w10
 add w22,w22,w12
 add w23,w23,w25
 ror w13,w13,#31
 orr w25,w24,w20
 and w26,w24,w20
 eor w14,w14,w16
 ror w27,w23,#27
 and w25,w25,w21
 add w21,w21,w28
 eor w14,w14,w6
 add w22,w22,w27
 orr w25,w25,w26
 ror w24,w24,#2
 eor w14,w14,w11
 add w21,w21,w13
 add w22,w22,w25
 ror w14,w14,#31
 orr w25,w23,w24
 and w26,w23,w24
 eor w15,w15,w17
 ror w27,w22,#27
 and w25,w25,w20
 add w20,w20,w28
 eor w15,w15,w7
 add w21,w21,w27
 orr w25,w25,w26
 ror w23,w23,#2
 eor w15,w15,w12
 add w20,w20,w14
 add w21,w21,w25
 ror w15,w15,#31
 movz w28,#0xc1d6
 movk w28,#0xca62,lsl#16
 orr w25,w22,w23
 and w26,w22,w23
 eor w16,w16,w19
 ror w27,w21,#27
 and w25,w25,w24
 add w24,w24,w28
 eor w16,w16,w8
 add w20,w20,w27
 orr w25,w25,w26
 ror w22,w22,#2
 eor w16,w16,w13
 add w24,w24,w15
 add w20,w20,w25
 ror w16,w16,#31
 eor w17,w17,w3
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w17,w17,w9
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w17,w17,w14
 add w23,w23,w16
 add w24,w24,w25
 ror w17,w17,#31
 eor w19,w19,w4
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w19,w19,w10
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w19,w19,w15
 add w22,w22,w17
 add w23,w23,w25
 ror w19,w19,#31
 eor w3,w3,w5
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w3,w3,w11
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w3,w3,w16
 add w21,w21,w19
 add w22,w22,w25
 ror w3,w3,#31
 eor w4,w4,w6
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w4,w4,w12
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w4,w4,w17
 add w20,w20,w3
 add w21,w21,w25
 ror w4,w4,#31
 eor w5,w5,w7
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w5,w5,w13
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w5,w5,w19
 add w24,w24,w4
 add w20,w20,w25
 ror w5,w5,#31
 eor w6,w6,w8
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w6,w6,w14
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w6,w6,w3
 add w23,w23,w5
 add w24,w24,w25
 ror w6,w6,#31
 eor w7,w7,w9
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w7,w7,w15
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w7,w7,w4
 add w22,w22,w6
 add w23,w23,w25
 ror w7,w7,#31
 eor w8,w8,w10
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w8,w8,w16
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w8,w8,w5
 add w21,w21,w7
 add w22,w22,w25
 ror w8,w8,#31
 eor w9,w9,w11
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w9,w9,w17
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w9,w9,w6
 add w20,w20,w8
 add w21,w21,w25
 ror w9,w9,#31
 eor w10,w10,w12
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w10,w10,w19
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w10,w10,w7
 add w24,w24,w9
 add w20,w20,w25
 ror w10,w10,#31
 eor w11,w11,w13
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w11,w11,w3
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w11,w11,w8
 add w23,w23,w10
 add w24,w24,w25
 ror w11,w11,#31
 eor w12,w12,w14
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w12,w12,w4
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w12,w12,w9
 add w22,w22,w11
 add w23,w23,w25
 ror w12,w12,#31
 eor w13,w13,w15
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w13,w13,w5
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w13,w13,w10
 add w21,w21,w12
 add w22,w22,w25
 ror w13,w13,#31
 eor w14,w14,w16
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w14,w14,w6
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 eor w14,w14,w11
 add w20,w20,w13
 add w21,w21,w25
 ror w14,w14,#31
 eor w15,w15,w17
 eor w25,w24,w22
 ror w27,w21,#27
 add w24,w24,w28
 eor w15,w15,w7
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 eor w15,w15,w12
 add w24,w24,w14
 add w20,w20,w25
 ror w15,w15,#31
 eor w16,w16,w19
 eor w25,w23,w21
 ror w27,w20,#27
 add w23,w23,w28
 eor w16,w16,w8
 eor w25,w25,w22
 add w24,w24,w27
 ror w21,w21,#2
 eor w16,w16,w13
 add w23,w23,w15
 add w24,w24,w25
 ror w16,w16,#31
 eor w17,w17,w3
 eor w25,w22,w20
 ror w27,w24,#27
 add w22,w22,w28
 eor w17,w17,w9
 eor w25,w25,w21
 add w23,w23,w27
 ror w20,w20,#2
 eor w17,w17,w14
 add w22,w22,w16
 add w23,w23,w25
 ror w17,w17,#31
 eor w19,w19,w4
 eor w25,w21,w24
 ror w27,w23,#27
 add w21,w21,w28
 eor w19,w19,w10
 eor w25,w25,w20
 add w22,w22,w27
 ror w24,w24,#2
 eor w19,w19,w15
 add w21,w21,w17
 add w22,w22,w25
 ror w19,w19,#31
 ldp w4,w5,[x0]
 eor w25,w20,w23
 ror w27,w22,#27
 add w20,w20,w28
 eor w25,w25,w24
 add w21,w21,w27
 ror w23,w23,#2
 add w20,w20,w19
 add w21,w21,w25
 ldp w6,w7,[x0,#8]
 eor w25,w24,w22
 ror w27,w21,#27
 eor w25,w25,w23
 add w20,w20,w27
 ror w22,w22,#2
 ldr w8,[x0,#16]
 add w20,w20,w25
 add w21,w21,w5
 add w22,w22,w6
 add w20,w20,w4
 add w23,w23,w7
 add w24,w24,w8
 stp w20,w21,[x0]
 stp w22,w23,[x0,#8]
 str w24,[x0,#16]
 cbnz x2,.Loop

 ldp x19,x20,[sp,#16]
 ldp x21,x22,[sp,#32]
 ldp x23,x24,[sp,#48]
 ldp x25,x26,[sp,#64]
 ldp x27,x28,[sp,#80]
 ldr x29,[sp],#96
 ret
.size sha1_block_data_order,.-sha1_block_data_order
.type sha1_block_armv8,%function
.align 6
sha1_block_armv8:
.Lv8_entry:
 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 adr x4,.Lconst
 eor v1.16b,v1.16b,v1.16b
 ld1 {v0.4s},[x0],#16
 ld1 {v1.s}[0],[x0]
 sub x0,x0,#16
 ld1 {v16.4s,v17.4s,v18.4s,v19.4s},[x4]

.Loop_hw:
 ld1 {v4.16b,v5.16b,v6.16b,v7.16b},[x1],#64
 sub x2,x2,#1
 rev32 v4.16b,v4.16b
 rev32 v5.16b,v5.16b

 add v20.4s,v16.4s,v4.4s
 rev32 v6.16b,v6.16b
 orr v22.16b,v0.16b,v0.16b

 add v21.4s,v16.4s,v5.4s
 rev32 v7.16b,v7.16b
.inst 0x5e280803
.inst 0x5e140020
 add v20.4s,v16.4s,v6.4s
.inst 0x5e0630a4
.inst 0x5e280802
.inst 0x5e150060
 add v21.4s,v16.4s,v7.4s
.inst 0x5e2818e4
.inst 0x5e0730c5
.inst 0x5e280803
.inst 0x5e140040
 add v20.4s,v16.4s,v4.4s
.inst 0x5e281885
.inst 0x5e0430e6
.inst 0x5e280802
.inst 0x5e150060
 add v21.4s,v17.4s,v5.4s
.inst 0x5e2818a6
.inst 0x5e053087
.inst 0x5e280803
.inst 0x5e140040
 add v20.4s,v17.4s,v6.4s
.inst 0x5e2818c7
.inst 0x5e0630a4
.inst 0x5e280802
.inst 0x5e151060
 add v21.4s,v17.4s,v7.4s
.inst 0x5e2818e4
.inst 0x5e0730c5
.inst 0x5e280803
.inst 0x5e141040
 add v20.4s,v17.4s,v4.4s
.inst 0x5e281885
.inst 0x5e0430e6
.inst 0x5e280802
.inst 0x5e151060
 add v21.4s,v17.4s,v5.4s
.inst 0x5e2818a6
.inst 0x5e053087
.inst 0x5e280803
.inst 0x5e141040
 add v20.4s,v18.4s,v6.4s
.inst 0x5e2818c7
.inst 0x5e0630a4
.inst 0x5e280802
.inst 0x5e151060
 add v21.4s,v18.4s,v7.4s
.inst 0x5e2818e4
.inst 0x5e0730c5
.inst 0x5e280803
.inst 0x5e142040
 add v20.4s,v18.4s,v4.4s
.inst 0x5e281885
.inst 0x5e0430e6
.inst 0x5e280802
.inst 0x5e152060
 add v21.4s,v18.4s,v5.4s
.inst 0x5e2818a6
.inst 0x5e053087
.inst 0x5e280803
.inst 0x5e142040
 add v20.4s,v18.4s,v6.4s
.inst 0x5e2818c7
.inst 0x5e0630a4
.inst 0x5e280802
.inst 0x5e152060
 add v21.4s,v19.4s,v7.4s
.inst 0x5e2818e4
.inst 0x5e0730c5
.inst 0x5e280803
.inst 0x5e142040
 add v20.4s,v19.4s,v4.4s
.inst 0x5e281885
.inst 0x5e0430e6
.inst 0x5e280802
.inst 0x5e151060
 add v21.4s,v19.4s,v5.4s
.inst 0x5e2818a6
.inst 0x5e053087
.inst 0x5e280803
.inst 0x5e141040
 add v20.4s,v19.4s,v6.4s
.inst 0x5e2818c7
.inst 0x5e280802
.inst 0x5e151060
 add v21.4s,v19.4s,v7.4s

.inst 0x5e280803
.inst 0x5e141040

.inst 0x5e280802
.inst 0x5e151060

 add v1.4s,v1.4s,v2.4s
 add v0.4s,v0.4s,v22.4s

 cbnz x2,.Loop_hw

 st1 {v0.4s},[x0],#16
 st1 {v1.s}[0],[x0]

 ldr x29,[sp],#16
 ret
.size sha1_block_armv8,.-sha1_block_armv8
.align 6
.Lconst:
.long 0x5a827999,0x5a827999,0x5a827999,0x5a827999
.long 0x6ed9eba1,0x6ed9eba1,0x6ed9eba1,0x6ed9eba1
.long 0x8f1bbcdc,0x8f1bbcdc,0x8f1bbcdc,0x8f1bbcdc
.long 0xca62c1d6,0xca62c1d6,0xca62c1d6,0xca62c1d6
.L_gnutls_arm_cpuid_s:



.quad _gnutls_arm_cpuid_s-.

.byte 83,72,65,49,32,98,108,111,99,107,32,116,114,97,110,115,102,111,114,109,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
.align 2
.comm _gnutls_arm_cpuid_s,4,4
.section .note.GNU-stack,"",%progbits
