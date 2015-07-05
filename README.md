# Simple Substitution Cipher/Decipherer

A simple substitution uses a single character shift to encrypt a message:

```ruby
shift("abcd", 1) => "bcde"
shift("abcd", 2) => "cdef"
```

#### The Challenge:

Provide a simple substitution decipherer to decode messages encrypted using a simple substitution cipher.

One hueristic to achieve this is to take a "fingerprint" of the English language--e.g. what is the distribution of characters across major English texts? Compare this fingerprint to the fingerprints of decrypted messages to guess the original cipher.

Another hueristic is to rank how many decoded words do not appear in the dictionary. This hueristic will miss some obvious English words, like proper nouns, and is best used in conjunction with the first hueristic.

It doesn't matter how you decipher messages, so long as your decipherer can decrypt the encrypted messages :)
