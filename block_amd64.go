// Code generated by command: go run block.go -out ../block_amd64.s -stubs ../block_amd64.go -pkg md4. DO NOT EDIT.

package md4

// block SHA-1 hashes the 64-byte message m into the running state h.
func block(h *[4]uint32, m []byte)
