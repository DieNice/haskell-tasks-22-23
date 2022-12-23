-- Определите функцию, вычисляющую двойной факториал,
-- то есть произведение натуральных чисел, не превосходящих
-- заданного числа и имеющих ту же четность.

-- Например: 7!!=7⋅5⋅3⋅1,  8!!=8⋅6⋅4⋅2.

-- Предполагается, что аргумент функции может принимать
-- только неотрицательные значения.

import Text.Printf

doubleFactorial :: Integer -> Integer
doubleFactorial 0 = 1
doubleFactorial 1 = 1
doubleFactorial n = n * doubleFactorial (n - 2)

main = do
    printf "7!! = %d\n" (doubleFactorial 7)
    printf "8!! = %d\n" (doubleFactorial 8)