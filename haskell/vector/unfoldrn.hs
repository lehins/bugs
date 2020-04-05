module Main where

import Control.Concurrent
import Control.Concurrent.Async
import Control.Exception
import qualified Data.Vector.Primitive as V
import qualified Data.Array as A
import GHC.Exts as Exts
import Data.Set


main = do
  -- eRes <- try $ concurrently_
  --   (print =<< (V.unfoldrNM (maxBound `div` 8) (const $ pure Nothing) () :: IO (V.Vector Int)))
  --   (print "foo" >> threadDelay 1000000 >> print "bar")
  -- print (eRes :: Either AsyncException ())

  print (Exts.fromListN 20 [1,2,3,4] :: Set Int)
  -- -- let xs = [1, 2, 3, 4, 5] :: [Int]
  -- --print $ V.fromListN (maxBound `div` 8) xs


