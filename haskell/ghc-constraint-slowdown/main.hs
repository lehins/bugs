{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}


data V3 e where
  V3f :: !Float  -> !Float  -> !Float  -> V3 Float
  V3d :: !Double -> !Double -> !Double -> V3 Double

-- unV3 :: V3 e -> (e, e, e)
-- unV3 v =
--   case v of
--     V3f x y z -> (x, y, z)
--     V3d x y z -> (x, y, z)

-- class CApplicative c e where

--   cliftA2 :: (a -> b -> e) -> c a -> c b -> c e


-- instance CApplicative V3 Float where
--   cliftA2 f v1 v2 = V3f (f x1 x2) (f y1 y2) (f z1 z2)
--     where
--       (x1, y1, z1) = unV3 v1
--       (x2, y2, z2) = unV3 v2

-- instance CApplicative V3 Double where
--   cliftA2 f v1 v2 = V3d (f x1 x2) (f y1 y2) (f z1 z2)
--     where
--       (x1, y1, z1) = unV3 v1
--       (x2, y2, z2) = unV3 v2

class CFoldable c e where
  cfoldl :: (a -> e -> a) -> a -> c e -> a

instance CFoldable V3 Float where
  cfoldl f acc (V3f x y z) = f (f (f acc x) y) z

instance CFoldable V3 Double where
  cfoldl f acc (V3d x y z) = f (f (f acc x) y) z


main :: IO ()
main = do
  let v = V3f 1 2 3
  print $ cfoldl (+) 0 v
