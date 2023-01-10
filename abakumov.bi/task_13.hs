import Data.Function ( on )

multSecond :: (a, Double) -> (a, Double) -> Double
multSecond = g `on` h
             where
                 g = (*)
                 h = snd

main = do
    print (multSecond ('A', -9) ('E', 5))
    print (multSecond ('A', 2) ('E', 7))