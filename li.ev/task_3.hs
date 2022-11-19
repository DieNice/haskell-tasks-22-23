fibonacci :: Integer -> Integer

fibonacci n = helper 0 1 n


helper :: Integer -> Integer -> Integer -> Integer
helper acc1 acc2 n | n == 0 = acc1
                   | n > 0 = helper (acc1 + acc2) acc1 (n - 1)
                   | n < 0 = helper acc2 (acc1 - acc2) (n + 1)

main = print (fibonacci (-5))
