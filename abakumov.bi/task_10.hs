type Student = (String, Double)

getGpa :: Student -> Double
getGpa (_, gpa) = gpa

sort :: [Student] -> [Student]
sort [] = []
sort (h:t) = sort [x | x <- t, getGpa x > getGpa h] ++ [h] ++ sort [x | x <- t, getGpa x <= getGpa h]

additionalTaskListComprehension :: [Integer] -> [Integer]
additionalTaskListComprehension nums = [if even x then round(fromIntegral x / 2) else x * 10 | x <- nums]

main = do
    print (sort [("a", 4.0), ("a", 4.01), ("a", 4.20), ("a", 4.2)])
    print (additionalTaskListComprehension [6, 1, 2, 3, 4, 5, 0, -1, -2])