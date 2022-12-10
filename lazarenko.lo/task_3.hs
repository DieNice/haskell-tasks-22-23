-- Задание:
--  Реализация функции для вычисления числа Фибоначи.
--  Нужно использовать аккумуляторы, чтобы более эфективно решить задачу.
import Data.Time ( diffUTCTime, getCurrentTime )
import Control.Monad ()

main :: IO [()]
main = do
    mapM testTimeFibonachi xs

    where
        xs::[Integer]
        xs = [x*5 | x <- [1 .. 30]]

    
helper :: (Eq t1, Num t1, Num t2) => t2 -> t2 -> t1 -> t2
helper prev cur n | n == 1 = cur
                | otherwise = helper cur (prev + cur) (n-1)

testTimeFibonachi :: Integer -> IO ()
testTimeFibonachi x = let
    fibonacci :: Integer -> Integer
    fibonacci n | n == 0 = 0
                | n == 1 = 1
                | n >= 0 = helper 0 1 n
                | n < 0 = helper 0 1 (abs n) * (-1)^((-n)-1)
    in do
        print ("n: " ++ show x)
        start <- getCurrentTime
        print ("res: " ++ show (fibonacci x))
        stop <- getCurrentTime
        print ("time: " ++ show(diffUTCTime stop start))
        putStr "\n"