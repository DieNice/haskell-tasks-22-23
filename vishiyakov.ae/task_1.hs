
-- TASK 1

-- Задание:
-- Определите функцию, вычисляющую двойной факториал, то есть произведение натуральных чисел, не превосходящих заданного числа и имеющих ту же четность.
-- Например: 7!!=7⋅5⋅3⋅1, 8!!=8⋅6⋅4⋅2.
-- Предполагается, что аргумент функции может принимать только неотрицательные значения.

main :: IO()
main = do
    print $ doubleFact 1
    print $ doubleFact 2
    print $ doubleFact 7
    print $ doubleFact 8
    print $ doubleFact (-8)
    print $ doubleFact 0


doubleFact :: Integer -> Integer
doubleFact 0 = 0
doubleFact 1 = 1
doubleFact 2 = 2
doubleFact n = if n > 0 then n * doubleFact (n-2) else undefined