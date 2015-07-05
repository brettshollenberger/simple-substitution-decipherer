# Simple Substitution Cipher/Decipherer

A simple substitution uses a single character shift to encrypt a message:

shift("abcd", 1) => "bcde"
shift("abcd", 2) => "cdef"

The provided simple substitution decipherer uses two heuristics to decode messages:

1) Rank decoded messages of all single character shifts (1-26) by the resultant distribution of characters compared to the "fingerprint" of the English language (using a major work of English literature, A Tale of Two Cities, as the seed text).

2) Rank decoded messages based on how many decoded words do not appear in the dictionary provided by a standard Linux distribution (`/usr/share/dict/words`)

The decipherer selects the single character decryption key that performs best across these two heuristics uniformly (although the "English fingerprint" heuristic is generally accepted on its own).
