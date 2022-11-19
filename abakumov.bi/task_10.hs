type Student = (String, Double)

getGpa :: Student -> Double
getGpa (_, gpa) = gpa

sort :: [Student] -> [Student]
sort [] = []
sort (h:t) = sort [x | x <- t, getGpa x > getGpa h] ++ [h] ++ sort [x | x <- t, getGpa x <= getGpa h]

main = do
    print (sort [("a", 4.0), ("a", 4.01), ("a", 4.20), ("a", 4.2)])