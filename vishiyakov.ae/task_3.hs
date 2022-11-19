
-- TASK 3

-- фибоначи c использованием аккумулятора

main :: IO()
main = do
    print $ fibonacci (-10)
    print $ fibonacci 10
    print $ fibonacci (-9)
    print $ fibonacci 9
    print $ fibonacci (-8)
    print $ fibonacci 8
    print $ fibonacci (-7)
    print $ fibonacci 7


fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n > 1 = helper 0 1 n
            | n < 0 = (-1)^((-n) + 1) * helper 0 1 (-n) -- F(-n) = (-1)^(n + 1) * F(n)

helper :: Integer -> Integer -> Integer -> Integer
helper x y 0 = x
helper x y n = helper y (x + y) (n - 1)


