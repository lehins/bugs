{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Lib
import Data.Word

main :: IO ()
main = do
  print $ round (fromIntegral (maxBound :: Word64) * (1 :: Double))
  print $ round (fromIntegral (maxBound :: Word64) :: Double)
  print (stretch (1 :: Double) :: Word64)
  print (foo 1)
  print bar
  print (round (fromIntegral (maxBound :: Word64) :: Double) :: Word64)
  print (round (fromIntegral (maxBound :: Int)) :: Int)
  print (fromIntegral (maxBound :: Word64) :: Double)
  print (fromInteger (toInteger (maxBound :: Word64)) :: Double)
  print (fromInteger (toInteger (18446744073709551615 :: Word64)) :: Double)
  print (fromInteger 18446744073709551615 :: Double)
  print (fromIntegral (maxBound :: Word32) :: Float)
  print (fromIntegral (maxBound :: Word64) :: Float)

foo :: Double -> Word64
foo x = round (fromIntegral (maxBound :: Word64) * x)

bar :: Word64
bar = round (fromIntegral (maxBound :: Word64) :: Rational)

stretch :: forall a b. (RealFloat a, Integral b, Bounded b) => a -> b
stretch e = round (fromIntegral (maxBound :: b) * clamp01 e)
  --roundRealFloatPositive (fromIntegral (maxBound :: b) * clamp01 e)
{-# INLINE stretch #-}

-- | Clamp a value to @[0, 1]@ range.
clamp01 :: RealFloat a => a -> a
clamp01 x = min (max 0 x) 1
{-# INLINE clamp01 #-}
