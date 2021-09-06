// Copyright 2021 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package tests

import (
	"bytes"
	"hash"
	"math/rand"
	"testing"

	"github.com/mmcloughlin/md4"
	openssl "github.com/ricardobranco777/go-openssl/md4"
)

func TestLengths(t *testing.T) {
	N := 1 << 14
	buf := make([]byte, N)
	for n := 0; n < N; n++ {
		// Initialize random buffer.
		b := buf[:n]
		rand.Read(b)

		// Expected hash.
		expect := sum(openssl.New(), b)
		got := sum(md4.New(), b)

		if !bytes.Equal(expect, got) {
			t.FailNow()
		}
	}
}

func sum(h hash.Hash, b []byte) []byte {
	h.Reset()
	h.Write(b)
	return h.Sum(nil)
}
