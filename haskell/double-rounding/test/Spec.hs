{-# LANGUAGE MagicHash #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Control.Monad
import Data.Ratio
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import GHC.Float.RealFracMethods
import GHC.Float
import GHC.Integer

roundToPlace :: Integer -> Double -> Double
roundToPlace decPlace amount =
  fromInteger (round $ amount * (10^decPlace)) / 10.0^^decPlace


main :: IO ()
main =
  hspec $ do
    describe "Rounding doesn't roundtrip" $ do
      it "1 digit (Rational)" $
        forM_ [0 .. (10 ^ n - 1)] $ \num ->
          let r = num % 10 ^ n
           in toRational (roundToPlace n (fromRational r)) `shouldBe` r
      prop "23 digits (Double)" $ \num ->
        forAll (choose (1, 23)) $ \digits ->
          let r = num % (10 ^ digits)
           in fromRational r `shouldBe` roundToPlace digits (fromRational r)
      prop "Optimized round" $ \f ->
        truncate f === double2Int f --truncateDoubleInt f
    describe "blabla" $ do
      it "should be equl" $
        verbose $ \input -> round input `shouldBe` floor (input :: Double)
    -- https://gitlab.haskell.org/ghc/ghc/issues/17782
    describe "word2Double" $ do
      it "word2Double == doubleFromInteger (2^54 < x < 2^64)" $
        property $
        forAll (choose (2 ^ 54, maxBound)) $ \(w :: Word) ->
          word2Double w === D# (doubleFromInteger (toInteger w))
      it "word2Double == doubleFromInteger (2^54 < x < 2^63)" $
        property $
        forAll (choose (2 ^ 54, 2 ^ 63)) $ \(w :: Word) ->
          word2Double w === D# (doubleFromInteger (toInteger w))
      it "word2Double == doubleFromInteger (2^53 < x < 2^54)" $
        property $
        forAll (choose (2 ^ 52, 2 ^ 54)) $ \(w :: Word) ->
          word2Double w === D# (doubleFromInteger (toInteger w))
      it "int2Double == doubleFromInteger (2^52 < x < 2^63)" $
        property $
        forAll (choose (2 ^ 54, maxBound)) $ \(w :: Int) ->
          int2Double w === D# (doubleFromInteger (toInteger w))
      -- it "word2Double == fromInteger" $
      --   property $
      --   forAll (choose (2 ^ 54, maxBound)) $ \(w :: Word) ->
      --     word2Double w === fromInteger (toInteger w)
      -- it "word2Double == fromInteger (maxBound)" $ do
      --   let w = maxBound :: Word
      --    in word2Double w === fromInteger (toInteger w)
      -- it "word2Double == fromInteger (maxBound)" $ do
      --   let w = maxBound :: Word
      --    in word2Double w === fromInteger (toInteger w)
      -- it "word2Double == doubleFromInteger" $ do
      --   let w = maxBound :: Word
      --    in word2Double w === D# (doubleFromInteger (toInteger w))
  where
    n = 1
