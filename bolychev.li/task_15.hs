class Printable a where
 toString :: a -> String

instance Printable Bool where
 toString True = "true"
 toString False = "false"
instance Printable () where
 toString () = "unit type"
instance (Printable a, Printable b) => Printable(a,b) where
 toString (a1,b1) = "(" + toString a1 ++ "," ++ toString b1 + ")"