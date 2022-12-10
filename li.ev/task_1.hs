let doublefactorial :: Integer -> Integer
doublefactorial n | n == 1 = 1
                  | n == 2 = 2
                  | otherwise = n * doublefactorial (n - 2)

main = print(doublefactorial 4)
