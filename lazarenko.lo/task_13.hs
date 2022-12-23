-- Реализовать функции g и h так, чтобы
-- функция "multSecond x = g `on` h"
-- перемножала вторые элементы пар

import Data.Function ( on )

multSecond :: (a, Double) -> (a, Double) -> Double
multSecond = g `on` h
             where
                 g = (*)
                 h = snd

main = do
    print (multSecond ('A', 9) ('E', 5))
    print (multSecond ('A', 4) ('E', -3))