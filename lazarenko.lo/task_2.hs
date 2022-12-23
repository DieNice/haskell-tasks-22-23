import Data.Time
-- fibonacci 0 = 0
-- fibonacci 1 = 1
-- fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Изменить определение функции fibonacci так, чтобы
-- она была определена для всех целых чисел и порождала
-- при отрицательных аргументах указанную последовательность.

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n > 0     = fibonacci (n - 2) + fibonacci (n - 1)
            | otherwise = fibonacci (n + 2) - fibonacci (n + 1)

main = do
    print (fibonacci 10)
    print (fibonacci 0)
    print (fibonacci (-1))
    print (fibonacci (-10))

    start <- getCurrentTime
    print(fibonacci 25)
    stop <- getCurrentTime
    print (diffUTCTime stop start)