class Printable a where
    toString :: a -> String

instance Printable Bool where
    toString a = if a then "true" else "false"

instance Printable () where
    toString () = "unit type"


main = do
    print (toString True)
    print (toString False)
    print (toString ())