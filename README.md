# md4

[![Go Reference](https://pkg.go.dev/badge/github.com/mmcloughlin/md4.svg)](https://pkg.go.dev/github.com/mmcloughlin/md4)

MD4 hash algorithm in Go. Assembly-optimized for amd64 platforms.

MD4 is cryptographically broken and should should only be used where
compatibility with legacy systems, not security, is the goal.

## Thanks

This package is based up the [MD4 implementation in
`x/crypto`](https://github.com/golang/crypto/tree/32db794688a5a24a23a43f2a984cecd5b3d8da58/md4)
together with some internals borrowed from
[`crypto/md5`](https://github.com/golang/go/tree/a1938435d6361dcbc93a15ce0ace28748a45b85d/src/crypto/md5),
which is structurally very similar. For assembly micro-optimization it was very
helpful to consult the implementations of MD5 in
[Go](https://github.com/golang/go/blob/a1938435d6361dcbc93a15ce0ace28748a45b85d/src/crypto/md5/md5block_amd64.s)
and
[OpenSSL](https://github.com/openssl/openssl/blob/d4458e59f62b0d102069e53da41f1d5305a66912/crypto/md5/asm/md5-x86_64.pl),
[Marc Bevand](https://www.zorinaq.com/)'s assembly
[MD5](http://www.zorinaq.com/papers/md5-amd64.html), and
[Nayuki](https://www.nayuki.io)'s optimized
[MD4](https://github.com/nayuki/Native-hashes-for-Java/blob/0f4a908b8b2edc3c0e4f778dee4de2c189465304/native/md4-compress-x8664.S)/[MD5](https://www.nayuki.io/page/fast-md5-hash-implementation-in-x86-assembly).
[Ricardo Branco](https://github.com/ricardobranco777)'s [OpenSSL
bindings](https://github.com/ricardobranco777/go-openssl) were very helpful for
differential testing and providing a performance baseline.  Lastly, thanks to
[Michael Stapelberg](https://michael.stapelberg.ch) for providing the
[motivation for this
package](https://twitter.com/zekjur/status/1433878940154843145), to optimize his
[rsync daemon](https://github.com/gokrazy/rsync).

## License

`md4` is available under the [BSD 3-Clause License](LICENSE). The license
retains the copyright notice from [`x/crypto`](https://golang.org/x/crypto).
