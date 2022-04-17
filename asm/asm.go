// Copyright 2021 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	. "github.com/mmcloughlin/avo/build"
	. "github.com/mmcloughlin/avo/operand"
	. "github.com/mmcloughlin/avo/reg"
)

func main() {
	ConstraintExpr("amd64,!purego")
	TEXT("block", 0, "func(h *[4]uint32, m []byte)")
	Doc("block SHA-1 hashes the 64-byte message m into the running state h.")
	h := Mem{Base: Load(Param("h"), GP64())}
	m := Mem{Base: Load(Param("m").Base(), GP64())}
	X := func(i int) Mem { return m.Offset(i * 4) }

	Comment("Load initial hash.")
	hash := [4]Register{GP32(), GP32(), GP32(), GP32()}
	for i, r := range hash {
		MOVL(h.Offset(4*i), r)
	}

	Comment("Initialize registers.")
	a, b, c, d := GP32(), GP32(), GP32(), GP32()
	for i, r := range []Register{a, b, c, d} {
		MOVL(hash[i], r)
	}

	// Generate round updates.
	third := []struct {
		i []int
		s []int
		F func(Register, Register, Register) Register
		K uint32
	}{
		{
			i: []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
			s: []int{3, 7, 11, 19},
			F: choose,
			K: 0,
		},
		{
			i: []int{0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15},
			s: []int{3, 5, 9, 13},
			F: majority,
			K: 0x5a827999,
		},
		{
			i: []int{0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15},
			s: []int{3, 9, 11, 15},
			F: xor,
			K: 0x6ed9eba1,
		},
	}

	for r := 0; r < 48; r++ {
		Commentf("Round %d.", r)
		t := third[r/16]
		ADDL(X(t.i[r%16]), a)
		if t.K != 0 {
			ADDL(U32(t.K), a)
		}
		ADDL(t.F(b, c, d), a)
		ROLL(U8(t.s[r%4]), a)
		a, b, c, d = d, a, b, c
	}

	Comment("Final add.")
	for i, r := range []Register{a, b, c, d} {
		ADDL(r, hash[i])
	}

	Comment("Store results back.")
	for i, r := range hash {
		MOVL(r, h.Offset(4*i))
	}
	RET()

	Generate()
}

func choose(b, c, d Register) Register {
	r := GP32()
	MOVL(d, r)
	XORL(c, r)
	ANDL(b, r)
	XORL(d, r)
	return r
}

func majority(b, c, d Register) Register {
	t, r := GP32(), GP32()
	MOVL(c, t)
	ORL(d, t)
	ANDL(b, t)
	MOVL(c, r)
	ANDL(d, r)
	ORL(t, r)
	return r
}

func xor(b, c, d Register) Register {
	r := GP32()
	MOVL(c, r)
	XORL(d, r)
	XORL(b, r)
	return r
}
