-- Задание:
-- Реализуйте функцию, находящую сумму и количество цифр десятичной записи заданного целого числа.
-- sum'n'count :: Integer -> (Integer, Integer)
-- sum'n'count x = undefined
-- GHCi> sum'n'count (-39)
-- (12,2)

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = (sum, count)
    where
        sum = sum' (abs x)
        count = count' (abs x)
        sum' 0 = 0
        sum' x = (x `mod` 10) + sum' (x `div` 10)
        count' 0 = 0
        count' x = 1 + count' (x `div` 10)