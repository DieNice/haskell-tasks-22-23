{-# LANGUAGE InstanceSigs #-}

-- Реализовать вычисление с логированием, используя Log.

data Log a = Log [String] a deriving Show

toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f s = \x -> Log [s] (f x)

execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers x logger1 logger2 = Log (log1 ++ log2) value2
                                where
                                    Log log1 value1 = logger1 x
                                    Log log2 value2 = logger2 value1

main = do
    print (add1Log 3)
    print (mult2Log 3)
    print (execLoggers 3 add1Log mult2Log)
    where
        add1Log = toLogger (+1) "added one"
        mult2Log = toLogger (*2) "multiplied by 2"
