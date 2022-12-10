-- Задание: 
--  Реализуйте вычисление с логированием, используя Log. 

data Log a = Log [String] a deriving Show

main :: IO()
main = do
    let add1Log = toLogger (+1) "added one"
    print $ add1Log 3

    let mult2Log = toLogger (*2) "multiplied by 2"
    print $ mult2Log 3

    print $ execLoggers 3 add1Log mult2Log

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f s x = Log [s] (f x)

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers x f g = Log list gx where
                   Log fs fx = f x
                   Log gs gx = g fx
                   list = fs ++ gs