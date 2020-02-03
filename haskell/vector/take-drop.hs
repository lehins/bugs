module Main where

import qualified Data.Vector.Primitive as V

main = do
  let xs = [1, 2, 3, 4, 5] :: [Int]
  print $ V.take 8 $ V.fromList xs

