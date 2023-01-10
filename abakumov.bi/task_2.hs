import Data.Time

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = if x > 0 then fibonacci (x - 1) + fibonacci (x - 2) else fibonacci (x + 2) - fibonacci (x + 1)

main = do
    start <- getCurrentTime
    print(fibonacci 10)
    stop <- getCurrentTime
    print (diffUTCTime stop start)
    print(fibonacci (-10))