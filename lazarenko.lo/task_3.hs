import Data.Time
-- Написать функцию для вычисления числа факториала,
-- используя механизм аккумулятора.

factorial :: Integer -> Integer
factorial n | n >= 0    = helper 1 n
            | otherwise = error "n < 0"

helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)

main = do
    print (factorial 0)
    print (factorial 2)
    print (factorial 3)
    print (factorial 25)

    start <- getCurrentTime
    print(factorial 25)
    stop <- getCurrentTime
    print (diffUTCTime stop start)