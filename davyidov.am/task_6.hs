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
  print (split "  ")
  print (split "111 2222 3 zl 11111111")
  print (split " 1 2  3 4   ")