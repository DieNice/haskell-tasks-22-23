-- Задание:
--  Реализация функции для вычисления числа Фибоначи.

{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
-- Библиотека используется для вычисления времени
import Data.Time ( diffUTCTime, getCurrentTime )

import Control.Monad ()

main :: IO [()]
main = do
    -- Нужно было написать 30 тестов и так как обычный map работает со списками и возвращает список, 
    -- а в testTimeFibinachi я вывожу результат в консоль, пришлось воспользоваться монадой mapM.
    -- Причём из-за того, что функция вовращает множество IO (), то и сигнатура main изменилась на IO [()]

    -- Если попытаться запустить сейчас этот код, то на каком-то из элементов списка xs программа зависнет.
    -- В следующей таске объясню почему так происходит, а пока можно однозначно сказать, 
    -- что на вычисление каких-то больших значений затрачивается ну очень много времени. 
    -- Самое большое время было примерно 5 секунд
    mapM testTimeFibonachi xs

    where
        xs::[Integer]
        xs = [x*5 | x <- [1 .. 30]]

    -- Время выполнения может отличаться, но у меня вышло около 3 секунд
    -- Имеем экспоненциальную ассимпотитку (сложность O(2^n))

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