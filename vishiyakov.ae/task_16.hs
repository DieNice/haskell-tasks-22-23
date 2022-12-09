
-- TASK 16

-- Определить представителя класса Functor для типа данных, представляющего точку в трёхмерном пространстве

data Point3D a = Point3D a a a deriving Show

instance Functor Point3D where
   fmap f (Point3D x y z) = Point3D (f x) (f y) (f z)

main :: IO()
main = do
    print $ fmap (+ 1) (Point3D 5 6 7)