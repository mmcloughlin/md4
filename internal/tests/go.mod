module github.com/mmcloughlin/md4/internal/tests

go 1.17

require (
	github.com/mmcloughlin/md4 v0.0.0-00010101000000-000000000000
	github.com/ricardobranco777/go-openssl v0.0.0-20200811151806-76963704f0b8
	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
)

replace github.com/mmcloughlin/md4 => ../..
