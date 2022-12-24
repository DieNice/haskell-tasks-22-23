data St = St String Double deriving (Show)
sort :: [St] -> [St]
sort [] = []
sort (p:xs) =     sort xs1  ++  [p]  ++  sort xs2
                where  xs1 = [x | x <- xs, studentsGrade x > studentsGrade p] 
                       xs2 = [x | x <- xs, studentsGrade x <= studentsGrade p]
                       studentsGrade (St name grade) = grade
