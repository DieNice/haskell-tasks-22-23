-- Задание:
-- Задан список студентов. Элемент списка содержит фамилию студента и средний балл, полученный после сдачи экзаментов.
-- Отсортировать по убыванию среднего балла.

data Student = Student String Double deriving (Show)
students = [Student "Ivanov" 4.5, Student "Petrov" 4.3, Student "Sidorov" 4.7, Student "Kozlov" 4.1, Student "Sergeev" 4.9]

sortStudents :: [Student] -> [Student]
sortStudents [] = []
sortStudents (x:xs) = sortStudents [a | a <- xs, getMark a > getMark x] ++ [x] ++ sortStudents [a | a <- xs, getMark a <= getMark x]
    where getMark (Student _ mark) = mark
