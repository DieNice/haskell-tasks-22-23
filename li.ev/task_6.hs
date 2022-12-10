getListOfWords :: String -> [String]
getListOfWords string = helper string "" []

helper :: String -> String -> [String] -> [String]
helper "" word list = word:list
helper string word list =
    if (last string) == ' '
        then helper (init string) "" (word:list)
        else helper (init string) ((last string):word) list

main :: IO()
main = do
    let string = "The specified text consists of characters. The text contains words. The terminator of a word is a space. Build a list of words"
    print (getListOfWords string)
