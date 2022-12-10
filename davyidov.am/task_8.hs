qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs) = qsort (filter (> x) xs) ++ [x] ++ qsort (filter (<= x) xs)

main :: IO ()
main = do
  print (qsort [1, 3, 5, 1, 100, 1123, 123145])