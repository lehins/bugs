module Main where

import Data.Vector as V

main :: IO ()
main = do
  let v = V.unfoldr (\x -> Just (x, x + 1)) (0 :: Int)
  print $ V.take 4 ((1 :: Int) <$ v) -- diverges
