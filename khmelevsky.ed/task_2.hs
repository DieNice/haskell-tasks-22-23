-- Задание:
--  Реализация функции для вычисления числа Фибоначи.

-- Меня немного нервируют варнинги, поэтому добавил эту строчку, чтобы не отвлекали
-- P.S. Какая-то непонятная мне проблема с отступами в функции
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

-- Число для передачи в функцию получаем из консоли
main :: IO()
main = do
    input <- getLine
    let x = readNum input
    print $ fibonacci x

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n >= 0 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = fibonacci (n + 2) - fibonacci (n + 1)

-- функция нужна для считывания именно числа с консоли
readNum :: String -> Integer
readNum = read