import Data.Time

fibonacci :: Integer -> Integer
fibonacci x = helper x 0 1
helper x a b = if x == 0 
    then a 
    else if x > 0 
        then helper (x - 1) b (a + b) 
        else helper (x + 1) b (a - b)

main = do
    start <- getCurrentTime
    print(fibonacci 100)
    stop <- getCurrentTime
    print (diffUTCTime stop start)
    print(fibonacci (-100))