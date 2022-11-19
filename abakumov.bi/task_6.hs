split :: String -> [String]
split text =
  let helper :: [String] -> String -> String -> [String]
      helper words word "" = if word == "" then words else words ++ [word]
      helper words word text
        | head text == ' ' = helper (helper words word "") "" (tail text)
        | otherwise = helper words (word ++ [head text]) (tail text)
   in helper [] "" text

main = do
  print (split "")
  print (split "    ")
  print (split "     a bc def       ghij           klmno   pqrstu         vwxyz")