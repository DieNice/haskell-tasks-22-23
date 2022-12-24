
-- TASK 13
-- см hoogle on

import Data.Function ( on )

multSecond = g `on` h

g = (*)
h = snd

main :: IO()
main = do
    print $ multSecond ('A', 2) ('E', 7)
