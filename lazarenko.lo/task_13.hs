-- Задание:
-- Напишите реализацию функций g и h с использованием `on`.

import Data.Function ( on )

main :: IO()
main = do
    print $ multSecond ('A', 2) ('E', 7)

multSecond :: Num b => (a,b) -> (a,b) -> b
multSecond = g `on` h
g :: Num b => b -> b  -> b
g x y = x * y
h :: (a,b) -> b
h = snd