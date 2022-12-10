-- Задание:
--  Реализуйте функцию seqA, находящую элементы следующей рекуррентной последовательности
--  a0=1;a1=2;a2=3;ak+3=ak+2+ak+1−2ak.
--  Попытайтесь найти эффективное решение.

main :: IO()
main = do
    print $ seqA 301

seqA :: Integer -> Integer
seqA 0 = 1
seqA 1 = 2
seqA 2 = 3
seqA n = let helper x y z 0 = x
             helper x y z n = helper y z ((y + z) - 2*x) (n-1)
         in helper 1 2 3 n