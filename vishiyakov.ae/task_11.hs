
-- TASK 11


main :: IO ()
main = do
       print $ seqA 301


seqA :: Integer -> Integer
seqA n = let helpFun a b c n | n == 0 = a
                             | otherwise = helpFun b c (c + b - 2 * a) (n - 1)
         in helpFun 1 2 3 n