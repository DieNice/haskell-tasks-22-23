type Student = (String, Double)

getScore :: Student -> Double
getScore (_, gpa) = gpa

sort :: [Student] -> [Student]
sort [] = []
sort (h : t) = sort [x | x <- t, getScore x > getScore h] ++ [h] ++ sort [x | x <- t, getScore x <= getScore h]

main = do
  print (sort [])
  print (sort [("1", 4)])
  print (sort [("1", 4.5), ("2", 2.5), ("3", 4.6), ("4", 3)])