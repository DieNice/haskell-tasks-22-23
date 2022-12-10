-- Задание:
--  Реализация функции для вычисления числа Фибоначи.

{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
-- Библиотека используется для вычисления времени
import Data.Time ( diffUTCTime, getCurrentTime )

import Control.Monad ()

main :: IO [()]
main = do
    
    mapM testTimeFibonachi xs

    where
        xs::[Integer]
        xs = [x*5 | x <- [1 .. 30]]

    

testTimeFibonachi :: Integer -> IO ()
testTimeFibonachi x = let
    fibonacci :: Integer -> Integer
    fibonacci 0 = 0
    fibonacci 1 = 1
    fibonacci n | n >= 0 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = fibonacci (n + 2) - fibonacci (n + 1)
    in do
        print ("n: " ++ show x)
        start <- getCurrentTime
        print ("res: " ++ show (fibonacci x))
        stop <- getCurrentTime
        print ("time: " ++ show(diffUTCTime stop start))
        putStr "\n"