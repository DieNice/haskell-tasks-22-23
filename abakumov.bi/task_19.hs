getMaximum :: [Integer] -> Integer
getMaximum [] =  error "empty list found"
getMaximum [x] = x
getMaximum [x, y] = max x y
getMaximum (h:t) = max h (getMaximum t)


getMaximums :: [[Integer]] -> [Integer]
getMaximums = map getMaximum


main = do
    print ("Maximums: " ++ show maximums)
    print ("Maximum: " ++ show maximum)
    where
        maximums = getMaximums [[1, 4], [5, 3], [-1, 9, 2]]
        maximum = getMaximum maximums