splitText :: String -> [String]
splitText [] = []
splitText text = (takeWhile (/= '.') text) : splitText (dropWhile (== '.') (dropWhile (/= '.') text))

main = do
    print (splitText "Lorem ipsum. Curabitur   dapibus    id     erat    sit     amet     ornare. Mauris feugiat,")