-- Задание:
--  Определите функцию, вычисляющую двойной факториал, 
--  то есть произведение натуральных чисел, не превосходящих заданного числа и имеющих ту же четность. 
--  Например: 7!!=7⋅5⋅3⋅1, 8!!=8⋅6⋅4⋅2. Предполагается, что аргумент функции может принимать только неотрицательные значения.

main :: IO()
main = do
    input <- getLine
    let x = readNum input
    print $ doubleFact x

doubleFact :: Integer -> Integer
doubleFact n
  | n == 1 = 1
  | n == 2 = 2
  | otherwise = n * doubleFact (n-2) 

readNum :: String -> Integer
readNum = read