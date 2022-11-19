splitText :: String -> [String]
splitText [] = []
splitText text = (takeWhile (/= '.') text) : splitText (dropWhile (== '.') (dropWhile (/= '.') text))

main = do
  print (splitText "")
  print (splitText "  ")
  print (splitText "111. 222 2 3 zl. 11111111")
  print (splitText " 1 2  3 4   .")