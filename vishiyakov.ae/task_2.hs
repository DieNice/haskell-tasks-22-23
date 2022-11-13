
-- TASK 2

-- фибоначи для отрицатльных чисел

main :: IO ()
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
fibonacci n | n >= 0 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = fibonacci (n + 2) - fibonacci (n + 1)
