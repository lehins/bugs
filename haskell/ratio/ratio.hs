
import Data.Ratio
import GHC.Real

main :: IO ()
main = do
   --  let x = ((-9223372036854775808) % 2957808295740799111 :: Ratio Int)
  let x = ((-9223372036854775808) % 1478904147870399556 :: Ratio Int)
  print x
  print $ numerator x
  print $ denominator x
  case x of
    (n :% d) -> do
      print n
      print d
