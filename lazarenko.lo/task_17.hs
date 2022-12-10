-- Задание: Определить представителя класса Functor для типа данных GeomPrimitive
{-# LANGUAGE InstanceSigs #-}

data Point3D a = Point3D a a a deriving Show
data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a) deriving Show

-- Проверяем работоспособность на ситуациях из примеров к заданию
main :: IO()
main = do
    print $ (+1) <$> Point (Point3D 0 0 0)
    print $ (+1) <$> LineSegment (Point3D 0 0 0) (Point3D 1 1 1)

instance Functor Point3D where
   fmap :: (a -> b) -> Point3D a -> Point3D b
   fmap f (Point3D a b c)= Point3D (f a) (f b) (f c)

instance Functor GeomPrimitive where
   fmap :: (a -> b) -> GeomPrimitive a -> GeomPrimitive b
   fmap f (Point (Point3D x y z)) = Point (Point3D (f x) (f y) (f z))
   fmap f (LineSegment (Point3D x1 y1 z1) (Point3D x2 y2 z2)) = LineSegment (Point3D (f x1) (f y1) (f z1)) (Point3D (f x2) (f y2) (f z2))