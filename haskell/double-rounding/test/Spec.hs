
import Control.Monad
import Data.Ratio
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

roundToPlace :: Integer -> Double -> Double
roundToPlace decPlace amount =
  fromInteger (round $ amount * (10^decPlace)) / 10.0^^decPlace


main :: IO ()
main =
  hspec $
  describe "Rounding doesn't roundtrip" $ do
    it "1 digit (Rational)" $
      forM_ [0 .. (10 ^ n - 1)] $ \num ->
        let r = num % 10 ^ n
         in toRational (roundToPlace n (fromRational r)) `shouldBe` r
    prop "23 digits (Double)" $ \num ->
      forAll (choose (1, 23)) $ \digits ->
        let r = num % (10 ^ digits)
         in fromRational r `shouldBe` roundToPlace digits (fromRational r)
  where
    n = 1
