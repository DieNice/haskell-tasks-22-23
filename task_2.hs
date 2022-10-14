-- fibonacci 0 = 0
-- fibonacci 1 = 1
-- fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Изменить определение функции fibonacci так, чтобы
-- она была определена для всех целых чисел и порождала
-- при отрицательных аргументах указанную последовательность.

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n =
    if n > 0
    then fibonacci (n - 2) + fibonacci (n - 1)
    else fibonacci (n + 2) - fibonacci (n + 1)

main = do
    print (fibonacci 10)
    print (fibonacci 2)
    print (fibonacci 1)
    print (fibonacci 0)
    print (fibonacci (-1))
    print (fibonacci (-2))
    print (fibonacci (-10))