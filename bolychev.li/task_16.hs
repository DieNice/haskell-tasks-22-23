data Point3D a = Point3D a a a deriving Show
instance Functor Point3D where
   fmap = subtract 1