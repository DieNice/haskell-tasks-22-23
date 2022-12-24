data Log a = Log [String] a deriving Show
toLogger :: (a -> b) -> String -> (a -> Log b)
toLogger f s x = Log [s] (f x)
execLoggers :: a -> (a -> Log b) -> (b -> Log c) -> Log c
execLoggers x f g = Log list gx where
    Log fs fx = f x
    Log gs gx = g fx
    list = fs ++ gs