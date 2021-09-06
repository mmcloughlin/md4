// Copyright 2021 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package tests

import (
	"fmt"
	"hash"
	"testing"

	mmcloughlin "github.com/mmcloughlin/md4"
	openssl "github.com/ricardobranco777/go-openssl/md4"
	xcrypto "golang.org/x/crypto/md4"
)

var buf = make([]byte, 1<<20)

func BenchmarkHash(b *testing.B) {
	hashes := []struct {
		Name string
		New  func() hash.Hash
	}{
		{"xcrypto", xcrypto.New},
		{"mmcloughlin", mmcloughlin.New},
		{"openssl", openssl.New},
	}

	sizes := []struct {
		Name  string
		Bytes int64
	}{
		{"8Bytes", 8},
		{"1K", 1 << 10},
		{"8K", 8 << 10},
		{"16K", 16 << 10},
		{"32K", 32 << 10},
		{"1M", 1 << 20},
	}

	for _, size := range sizes {
		for _, impl := range hashes {
			name := fmt.Sprintf("size=%s/pkg=%s", size.Name, impl.Name)
			b.Run(name, func(b *testing.B) {
				h := impl.New()
				b.SetBytes(int64(size.Bytes))
				sum := make([]byte, h.Size())
				for i := 0; i < b.N; i++ {
					h.Reset()
					h.Write(buf[:size.Bytes])
					h.Sum(sum[:0])
				}
			})
		}
	}
}
