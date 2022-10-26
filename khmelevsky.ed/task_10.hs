-- Задание:
--  Задан список студентов. 
--  Элемент списка содержит фамилию студента и средний балл, 
--   полученный после сдачи экзаментов. 
--  Отсортировать по убыванию среднего балла.

import Data.List ( sortBy )
import Data.Function ( on )
 
main :: IO ()
main = do
    let second (_, x) = x
        cond f = f `on` second 
    print $ sortBy (cond $ flip compare) students
    where
        students :: [([Char],Float)]
        students = [
                ("Abakumov", 4.0),
                ("Khmelevsky", 4.33),
                ("Markov", 4.7),
                ("Kosicyna", 3.9)
            ]