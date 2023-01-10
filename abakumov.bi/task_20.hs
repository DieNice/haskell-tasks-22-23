{-# LANGUAGE TupleSections #-}

addToEach :: (Num a) => [a] -> a -> [a]
addToEach numbers number = map (+number) numbers

multiplyWith :: (Num a) => [a] -> a -> [a]
multiplyWith numbers number = map (*number) numbers

pairWith :: [a] -> b -> [(a, b)]
pairWith list element = map (, element) list

splitLists :: (a -> Bool) -> [a] -> [[a]]
splitLists p l = [filter p l, filter (not . p) l]

pairWithCount :: (Eq a) => [a] -> [(a, Int)]
pairWithCount list = map (\e -> (e, length $ filter (==e) list)) list

fNeighbor :: (Num a) => (a -> a -> a) -> [a] -> [a] -> [a]
fNeighbor f r [x, y] = r ++ [f x y]
fNeighbor f r l = fNeighbor f (r ++ [f (head l) (l !! 1)]) (tail l)

getNeighborDiffs :: (Num a) => [a] -> [a]
getNeighborDiffs = fNeighbor (-) []

getNeighborSums :: (Num a) => [a] -> [a]
getNeighborSums = fNeighbor (+) []


main = do
    print (addToEach [1, 2, 3, 4, 5] 5)
    print (multiplyWith [1, 2, 3, 4, 5] 5)
    print (pairWith [1, 2, 3, 4, 5] 5)
    print (splitLists (==1) [1, 42, 3, 4, 4])
    print (pairWithCount [1, 2, 3, 4, 4])
    print (getNeighborDiffs [1, 42, 3, 4, 4])
    print (getNeighborSums [1, 42, 3, 4, 4])