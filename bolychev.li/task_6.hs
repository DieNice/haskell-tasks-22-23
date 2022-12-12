split :: String -> [String]

split xs = case break (==' ') xs of 
  (ls, "") -> [ls]
  (ls, x:rs) -> ls : split rs
