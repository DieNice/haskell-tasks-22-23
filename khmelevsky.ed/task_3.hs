-- Задание:
--  Реализация функции для вычисления числа Фибоначи.
--  Нужно использовать аккумуляторы, чтобы более эфективно решить задачу.

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
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n >= 0 = helper 0 1 n
            | n < 0 = helper 0 1 (abs n) * (-1)^((-n)-1)

helper :: (Eq t1, Num t1, Num t2) => t2 -> t2 -> t1 -> t2
helper prev cur n | n == 1 = cur
                | otherwise = helper cur (prev + cur) (n-1)

-- функция нужна для считывания именно числа с консоли
readNum :: String -> Integer
readNum = read