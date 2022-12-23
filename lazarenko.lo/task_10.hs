-- Задан список студентов. Элемент списка содержит
-- фамилию студента и средний балл, полученный после
-- сдачи экзаменов. Отсортировать по убыванию среднего балла.

type Student = (String, Double)

getGpa :: Student -> Double
getGpa (_, gpa) = gpa

sort :: [Student] -> [Student]
sort [] = []
sort (h:t) = sort [x | x <- t, getGpa x > getGpa h] ++ [h] ++ sort [x | x <- t, getGpa x <= getGpa h]

main = do
    print (sort [])
    print (sort [("Surname", 4)])
    print (sort [("Surname", 2), ("Surname", 5), ("Surname", 2.4), ("Surname", 4.2)])