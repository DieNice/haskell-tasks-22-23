-- Задание:
-- Задан список элементами которого являются списки чисел. Сформировать список, содержащий максимальные элементы
-- каждого из подсписков. Найти максимальный элемент из этих максимальных.

listList = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]

maxList :: [[Int]] -> [Int]
maxList [] = []
maxList (x:xs) = (maximum x) : maxList xs

maxMax :: [[Int]] -> Int
maxMax = maximum . maxList

listMax = maxList listList
listMaxMax = maxMax listList
