fibonacci :: Integer -> Integer

fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n > 1 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = (-1) ^ (-n + 1) * fibonacci (-n)

main = print (fibonacci (-6))