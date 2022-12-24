on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
((+) `on` f) x y = f x + f y

multSecond :: (a, Integer) -> (a, Integer) -> Integer
multSecond = g `on` h where
 g = (*)
 h = snd