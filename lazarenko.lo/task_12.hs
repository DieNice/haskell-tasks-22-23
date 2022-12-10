-- Задание:
--  Реализуйте функцию, находящую сумму и количество цифр заданного целого числа.
--  sum'n'count :: Integer -> (Integer, Integer)
--  GHCi> sum'n'count (-39)
--  (12,2)

main :: IO()
main = do
    print $ sum'n'count (-39)

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x | x == 0 = (0, 1)
              | otherwise = (sum n, toInteger (length n)) 
              where n = digs x
digs :: Integer -> [Integer]
digs 0 = []
digs i | i < 0 = digs (-i) 
       | otherwise = digs (i `div` 10) ++ [i `mod` 10]