{-# LANGUAGE InstanceSigs #-}

data Point3D a = Point3D a a a deriving Show
data GeomPrimitive a = Point (Point3D a) | LineSegment (Point3D a) (Point3D a) deriving Show

instance Functor Point3D where
    fmap :: (a -> b) -> Point3D a -> Point3D b
    fmap f (Point3D x y z) = Point3D (f x) (f y) (f z) 

instance Functor GeomPrimitive where
    fmap :: (a -> b) -> GeomPrimitive a -> GeomPrimitive b
    fmap f (Point a) = Point (fmap f a)
    fmap f (LineSegment a b) = (LineSegment (fmap f a) (fmap f b))

main = do
    print (fmap (+1) $ Point (Point3D 0 0 0))
    print (fmap (+1) $ LineSegment (Point3D 0 0 0) (Point3D 1 1 1))