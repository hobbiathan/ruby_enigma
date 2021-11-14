# Enigma Project

Simple encryption/decryption program based off the [Enigma Machine](https://en.wikipedia.org/wiki/Enigma_machine)


## Encryption

To encrypt a message, `echo` a message into a new text file of your choosing like the following:

```
echo "hello world" > mouse.txt
```

The `encrypt.rb` file has four CLI arguments:

The `target file` to read from, `file` to write to, a `key` and `date`, as shown in the following:

```
                    target      file          key   date
ruby lib/encrypt.rb message.txt encrypted.txt 01612 041703



result:
Created 'encrypted.txt' with the key '01612' and date '041703'
```

Note: It is possible to encrypt a file without providing a `key` or `date` argument in the CLI, in which case a key is randomly generated, while the date is the current date.

```
ruby lib/encrypt.rb mouse.txt orange.txt


result:
Created 'orange.txt' with the key '34921' and date '111321'
```

## Decryption

The decrypt interaction pattern is similar to that of the Encryption interaction pattern, however, a key _needs_ to be provided for the program to function (and according date if the encryption date is not the same as the decryption date)

The following is an example of decryption from one of our above encrypted files:

```
ruby lib/decrypt.rb encrypted.txt decrypted.txt 01612 041703

result:
Created 'decrypted.txt' with key '01612' and date '041703'
```

The following is an example if the encrypted message was decrypted the _same day:_

```
ruby lib/decrypt.rb encrypted.txt decrypted.txt 01612


result:
Created 'decrypted.txt' with key '01612' and date '041703'
```
