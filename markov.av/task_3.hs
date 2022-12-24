import Data.Time
-- Написать функцию для вычисления числа факториала,
-- используя механизм аккумулятора.


helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)

-- Time complexity: O(n)
-- Auxiliary space: O(n)
factorial :: Integer -> Integer
factorial n | n >= 0    = helper 1 n
            | otherwise = error "n < 0"

-- Time complexity: O(n)
-- Auxiliary space: O(n)
recursiveFactorial :: Integer -> Integer
recursiveFactorial 0 = 1
recursiveFactorial n | n >= 0    = n * recursiveFactorial (n - 1)
                     | otherwise = error "n < 0"

main = do
    let n = 10000

    start <- getCurrentTime
    print (recursiveFactorial n * 0)
    stop <- getCurrentTime
    print ("Recursive: " ++ show (diffUTCTime stop start))

    start <- getCurrentTime
    print (factorial n * 0)
    stop <- getCurrentTime
    print ("Accumulator: " ++ show (diffUTCTime stop start))
