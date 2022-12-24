
-- TASK 12


sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x = helper (0, 0, abs(x))
                where
                helper (n, sum, x) | x < 10 = (x + sum, n + 1)
                                   | otherwise = helper(n + 1, sum + x `mod` 10, x `div` 10)


main :: IO ()
main = print $ sum'n'count (-39)