{-# LANGUAGE InstanceSigs #-}

-- Определите представителя класса Functor для
-- следующего типа данных, представляющего точку
-- в трёхмерном пространстве:
-- fmap (+1) (Point3D 5 6 7) -> Point3D 6 7 8

data Point3D a = Point3D a a a deriving Show

instance Functor Point3D where
    fmap :: (a -> b) -> Point3D a -> Point3D b
    fmap f (Point3D x y z) = Point3D (f x) (f y) (f z)    


main = do
    print (fmap (+1) (Point3D 5 6 7))