// Code generated by command: go run asm.go -out block_amd64.s -stubs block_amd64.go -pkg md4. DO NOT EDIT.

// +build amd64,!purego

// func block(h *[4]uint32, m []byte)
TEXT ·block(SB), $0-32
	MOVQ h+0(FP), AX
	MOVQ m_base+8(FP), CX

	// Load initial hash.
	MOVL (AX), DX
	MOVL 4(AX), BX
	MOVL 8(AX), SI
	MOVL 12(AX), DI

	// Initialize registers.
	MOVL DX, R8
	MOVL BX, R9
	MOVL SI, R10
	MOVL DI, R11

	// Round 0.
	ADDL (CX), R8
	MOVL R11, R12
	XORL R10, R12
	ANDL R9, R12
	XORL R11, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 1.
	ADDL 4(CX), R11
	MOVL R10, R12
	XORL R9, R12
	ANDL R8, R12
	XORL R10, R12
	ADDL R12, R11
	ROLL $0x07, R11

	// Round 2.
	ADDL 8(CX), R10
	MOVL R9, R12
	XORL R8, R12
	ANDL R11, R12
	XORL R9, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 3.
	ADDL 12(CX), R9
	MOVL R8, R12
	XORL R11, R12
	ANDL R10, R12
	XORL R8, R12
	ADDL R12, R9
	ROLL $0x13, R9

	// Round 4.
	ADDL 16(CX), R8
	MOVL R11, R12
	XORL R10, R12
	ANDL R9, R12
	XORL R11, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 5.
	ADDL 20(CX), R11
	MOVL R10, R12
	XORL R9, R12
	ANDL R8, R12
	XORL R10, R12
	ADDL R12, R11
	ROLL $0x07, R11

	// Round 6.
	ADDL 24(CX), R10
	MOVL R9, R12
	XORL R8, R12
	ANDL R11, R12
	XORL R9, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 7.
	ADDL 28(CX), R9
	MOVL R8, R12
	XORL R11, R12
	ANDL R10, R12
	XORL R8, R12
	ADDL R12, R9
	ROLL $0x13, R9

	// Round 8.
	ADDL 32(CX), R8
	MOVL R11, R12
	XORL R10, R12
	ANDL R9, R12
	XORL R11, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 9.
	ADDL 36(CX), R11
	MOVL R10, R12
	XORL R9, R12
	ANDL R8, R12
	XORL R10, R12
	ADDL R12, R11
	ROLL $0x07, R11

	// Round 10.
	ADDL 40(CX), R10
	MOVL R9, R12
	XORL R8, R12
	ANDL R11, R12
	XORL R9, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 11.
	ADDL 44(CX), R9
	MOVL R8, R12
	XORL R11, R12
	ANDL R10, R12
	XORL R8, R12
	ADDL R12, R9
	ROLL $0x13, R9

	// Round 12.
	ADDL 48(CX), R8
	MOVL R11, R12
	XORL R10, R12
	ANDL R9, R12
	XORL R11, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 13.
	ADDL 52(CX), R11
	MOVL R10, R12
	XORL R9, R12
	ANDL R8, R12
	XORL R10, R12
	ADDL R12, R11
	ROLL $0x07, R11

	// Round 14.
	ADDL 56(CX), R10
	MOVL R9, R12
	XORL R8, R12
	ANDL R11, R12
	XORL R9, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 15.
	ADDL 60(CX), R9
	MOVL R8, R12
	XORL R11, R12
	ANDL R10, R12
	XORL R8, R12
	ADDL R12, R9
	ROLL $0x13, R9

	// Round 16.
	ADDL (CX), R8
	ADDL $0x5a827999, R8
	MOVL R10, R12
	ORL  R11, R12
	ANDL R9, R12
	MOVL R10, R13
	ANDL R11, R13
	ORL  R12, R13
	ADDL R13, R8
	ROLL $0x03, R8

	// Round 17.
	ADDL 16(CX), R11
	ADDL $0x5a827999, R11
	MOVL R9, R12
	ORL  R10, R12
	ANDL R8, R12
	MOVL R9, R13
	ANDL R10, R13
	ORL  R12, R13
	ADDL R13, R11
	ROLL $0x05, R11

	// Round 18.
	ADDL 32(CX), R10
	ADDL $0x5a827999, R10
	MOVL R8, R12
	ORL  R9, R12
	ANDL R11, R12
	MOVL R8, R13
	ANDL R9, R13
	ORL  R12, R13
	ADDL R13, R10
	ROLL $0x09, R10

	// Round 19.
	ADDL 48(CX), R9
	ADDL $0x5a827999, R9
	MOVL R11, R12
	ORL  R8, R12
	ANDL R10, R12
	MOVL R11, R13
	ANDL R8, R13
	ORL  R12, R13
	ADDL R13, R9
	ROLL $0x0d, R9

	// Round 20.
	ADDL 4(CX), R8
	ADDL $0x5a827999, R8
	MOVL R10, R12
	ORL  R11, R12
	ANDL R9, R12
	MOVL R10, R13
	ANDL R11, R13
	ORL  R12, R13
	ADDL R13, R8
	ROLL $0x03, R8

	// Round 21.
	ADDL 20(CX), R11
	ADDL $0x5a827999, R11
	MOVL R9, R12
	ORL  R10, R12
	ANDL R8, R12
	MOVL R9, R13
	ANDL R10, R13
	ORL  R12, R13
	ADDL R13, R11
	ROLL $0x05, R11

	// Round 22.
	ADDL 36(CX), R10
	ADDL $0x5a827999, R10
	MOVL R8, R12
	ORL  R9, R12
	ANDL R11, R12
	MOVL R8, R13
	ANDL R9, R13
	ORL  R12, R13
	ADDL R13, R10
	ROLL $0x09, R10

	// Round 23.
	ADDL 52(CX), R9
	ADDL $0x5a827999, R9
	MOVL R11, R12
	ORL  R8, R12
	ANDL R10, R12
	MOVL R11, R13
	ANDL R8, R13
	ORL  R12, R13
	ADDL R13, R9
	ROLL $0x0d, R9

	// Round 24.
	ADDL 8(CX), R8
	ADDL $0x5a827999, R8
	MOVL R10, R12
	ORL  R11, R12
	ANDL R9, R12
	MOVL R10, R13
	ANDL R11, R13
	ORL  R12, R13
	ADDL R13, R8
	ROLL $0x03, R8

	// Round 25.
	ADDL 24(CX), R11
	ADDL $0x5a827999, R11
	MOVL R9, R12
	ORL  R10, R12
	ANDL R8, R12
	MOVL R9, R13
	ANDL R10, R13
	ORL  R12, R13
	ADDL R13, R11
	ROLL $0x05, R11

	// Round 26.
	ADDL 40(CX), R10
	ADDL $0x5a827999, R10
	MOVL R8, R12
	ORL  R9, R12
	ANDL R11, R12
	MOVL R8, R13
	ANDL R9, R13
	ORL  R12, R13
	ADDL R13, R10
	ROLL $0x09, R10

	// Round 27.
	ADDL 56(CX), R9
	ADDL $0x5a827999, R9
	MOVL R11, R12
	ORL  R8, R12
	ANDL R10, R12
	MOVL R11, R13
	ANDL R8, R13
	ORL  R12, R13
	ADDL R13, R9
	ROLL $0x0d, R9

	// Round 28.
	ADDL 12(CX), R8
	ADDL $0x5a827999, R8
	MOVL R10, R12
	ORL  R11, R12
	ANDL R9, R12
	MOVL R10, R13
	ANDL R11, R13
	ORL  R12, R13
	ADDL R13, R8
	ROLL $0x03, R8

	// Round 29.
	ADDL 28(CX), R11
	ADDL $0x5a827999, R11
	MOVL R9, R12
	ORL  R10, R12
	ANDL R8, R12
	MOVL R9, R13
	ANDL R10, R13
	ORL  R12, R13
	ADDL R13, R11
	ROLL $0x05, R11

	// Round 30.
	ADDL 44(CX), R10
	ADDL $0x5a827999, R10
	MOVL R8, R12
	ORL  R9, R12
	ANDL R11, R12
	MOVL R8, R13
	ANDL R9, R13
	ORL  R12, R13
	ADDL R13, R10
	ROLL $0x09, R10

	// Round 31.
	ADDL 60(CX), R9
	ADDL $0x5a827999, R9
	MOVL R11, R12
	ORL  R8, R12
	ANDL R10, R12
	MOVL R11, R13
	ANDL R8, R13
	ORL  R12, R13
	ADDL R13, R9
	ROLL $0x0d, R9

	// Round 32.
	ADDL (CX), R8
	ADDL $0x6ed9eba1, R8
	MOVL R10, R12
	XORL R11, R12
	XORL R9, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 33.
	ADDL 32(CX), R11
	ADDL $0x6ed9eba1, R11
	MOVL R9, R12
	XORL R10, R12
	XORL R8, R12
	ADDL R12, R11
	ROLL $0x09, R11

	// Round 34.
	ADDL 16(CX), R10
	ADDL $0x6ed9eba1, R10
	MOVL R8, R12
	XORL R9, R12
	XORL R11, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 35.
	ADDL 48(CX), R9
	ADDL $0x6ed9eba1, R9
	MOVL R11, R12
	XORL R8, R12
	XORL R10, R12
	ADDL R12, R9
	ROLL $0x0f, R9

	// Round 36.
	ADDL 8(CX), R8
	ADDL $0x6ed9eba1, R8
	MOVL R10, R12
	XORL R11, R12
	XORL R9, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 37.
	ADDL 40(CX), R11
	ADDL $0x6ed9eba1, R11
	MOVL R9, R12
	XORL R10, R12
	XORL R8, R12
	ADDL R12, R11
	ROLL $0x09, R11

	// Round 38.
	ADDL 24(CX), R10
	ADDL $0x6ed9eba1, R10
	MOVL R8, R12
	XORL R9, R12
	XORL R11, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 39.
	ADDL 56(CX), R9
	ADDL $0x6ed9eba1, R9
	MOVL R11, R12
	XORL R8, R12
	XORL R10, R12
	ADDL R12, R9
	ROLL $0x0f, R9

	// Round 40.
	ADDL 4(CX), R8
	ADDL $0x6ed9eba1, R8
	MOVL R10, R12
	XORL R11, R12
	XORL R9, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 41.
	ADDL 36(CX), R11
	ADDL $0x6ed9eba1, R11
	MOVL R9, R12
	XORL R10, R12
	XORL R8, R12
	ADDL R12, R11
	ROLL $0x09, R11

	// Round 42.
	ADDL 20(CX), R10
	ADDL $0x6ed9eba1, R10
	MOVL R8, R12
	XORL R9, R12
	XORL R11, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 43.
	ADDL 52(CX), R9
	ADDL $0x6ed9eba1, R9
	MOVL R11, R12
	XORL R8, R12
	XORL R10, R12
	ADDL R12, R9
	ROLL $0x0f, R9

	// Round 44.
	ADDL 12(CX), R8
	ADDL $0x6ed9eba1, R8
	MOVL R10, R12
	XORL R11, R12
	XORL R9, R12
	ADDL R12, R8
	ROLL $0x03, R8

	// Round 45.
	ADDL 44(CX), R11
	ADDL $0x6ed9eba1, R11
	MOVL R9, R12
	XORL R10, R12
	XORL R8, R12
	ADDL R12, R11
	ROLL $0x09, R11

	// Round 46.
	ADDL 28(CX), R10
	ADDL $0x6ed9eba1, R10
	MOVL R8, R12
	XORL R9, R12
	XORL R11, R12
	ADDL R12, R10
	ROLL $0x0b, R10

	// Round 47.
	ADDL 60(CX), R9
	ADDL $0x6ed9eba1, R9
	MOVL R11, CX
	XORL R8, CX
	XORL R10, CX
	ADDL CX, R9
	ROLL $0x0f, R9

	// Final add.
	ADDL R8, DX
	ADDL R9, BX
	ADDL R10, SI
	ADDL R11, DI

	// Store results back.
	MOVL DX, (AX)
	MOVL BX, 4(AX)
	MOVL SI, 8(AX)
	MOVL DI, 12(AX)
	RET
