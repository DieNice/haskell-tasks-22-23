seqA :: Integer -> Integer
seqA n | n == 0 = 1
       | n == 1 = 2
       | n == 2 = 3
       | n >= 3 = let helper :: Integer -> Integer -> Integer -> Integer -> Integer
                      helper ak0 ak1 ak2 2 = ak2
                      helper ak0 ak1 ak2 k = helper ak1 ak2 (ak2 + ak1 - 2 * ak0) (k - 1)
                  in helper 1 2 3 n
       | otherwise = error "arg < 0"

main = do
    print (seqA 1)
    print (seqA 8)
    print (seqA 301)