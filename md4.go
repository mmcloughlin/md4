// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Package md4 implements the MD4 hash algorithm as defined in RFC 1320.
//
// Deprecated: MD4 is cryptographically broken and should should only be used
// where compatibility with legacy systems, not security, is the goal. Instead,
// use a secure hash like SHA-256 (from crypto/sha256).
package md4

import (
	"crypto"
	"encoding/binary"
	"hash"
)

//go:generate go run -modfile asm.mod asm.go -out block_amd64.s -stubs block_amd64.go -pkg md4

func init() {
	crypto.RegisterHash(crypto.MD4, New)
}

// Size of an MD4 checksum in bytes.
const Size = 16

// BlockSize is the block size of MD4 in bytes.
const BlockSize = 64

const (
	init0 = 0x67452301
	init1 = 0xEFCDAB89
	init2 = 0x98BADCFE
	init3 = 0x10325476
)

// digest represents the partial evaluation of a checksum.
type digest struct {
	s   [4]uint32
	x   [BlockSize]byte
	nx  int
	len uint64
}

func (d *digest) Reset() {
	d.s[0] = init0
	d.s[1] = init1
	d.s[2] = init2
	d.s[3] = init3
	d.nx = 0
	d.len = 0
}

// New returns a new hash.Hash computing the MD4 checksum.
func New() hash.Hash {
	d := new(digest)
	d.Reset()
	return d
}

func (d *digest) Size() int { return Size }

func (d *digest) BlockSize() int { return BlockSize }

func (d *digest) Write(p []byte) (int, error) {
	return d.write(p), nil
}

func (d *digest) write(p []byte) int {
	nn := len(p)
	d.len += uint64(nn)
	if d.nx > 0 {
		n := len(p)
		if n > BlockSize-d.nx {
			n = BlockSize - d.nx
		}
		for i := 0; i < n; i++ {
			d.x[d.nx+i] = p[i]
		}
		d.nx += n
		if d.nx == BlockSize {
			block(&d.s, d.x[0:])
			d.nx = 0
		}
		p = p[n:]
	}

	for len(p) >= BlockSize {
		block(&d.s, p)
		p = p[BlockSize:]
	}

	if len(p) > 0 {
		d.nx = copy(d.x[:], p)
	}
	return nn
}

func (d *digest) Sum(in []byte) []byte {
	// Make a copy of d so that caller can keep writing and summing.
	d0 := *d
	hash := d0.checkSum()
	return append(in, hash[:]...)
}

func (d *digest) checkSum() [Size]byte {
	// Append 0x80 to the end of the message and then append zeros
	// until the length is a multiple of 56 bytes. Finally append
	// 8 bytes representing the message length in bits.
	//
	// 1 byte end marker :: 0-63 padding bytes :: 8 byte length
	tmp := [1 + 63 + 8]byte{0x80}
	pad := (55 - d.len) % 64                             // calculate number of padding bytes
	binary.LittleEndian.PutUint64(tmp[1+pad:], d.len<<3) // append length in bits
	d.write(tmp[:1+pad+8])

	// The previous write ensures that a whole number of
	// blocks (i.e. a multiple of 64 bytes) have been hashed.
	if d.nx != 0 {
		panic("d.nx != 0")
	}

	var digest [Size]byte
	binary.LittleEndian.PutUint32(digest[0:], d.s[0])
	binary.LittleEndian.PutUint32(digest[4:], d.s[1])
	binary.LittleEndian.PutUint32(digest[8:], d.s[2])
	binary.LittleEndian.PutUint32(digest[12:], d.s[3])
	return digest
}

// Sum returns the MD4 checksum of the data.
func Sum(data []byte) [Size]byte {
	var d digest
	d.Reset()
	d.write(data)
	return d.checkSum()
}
