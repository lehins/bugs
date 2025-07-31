{-# LANGUAGE LambdaCase #-}
module Main where

import Control.Exception
import Data.List as List
import qualified Data.Vector as V
import qualified Data.Vector.Generic as VG
import qualified Data.Vector.Primitive as VP

sliceList :: Int -> Int -> [a] -> [a]
sliceList i n xs = List.take n (List.drop i xs)

sliceVectorProposed :: VG.Vector v a => Int -> Int -> v a -> v a
sliceVectorProposed i n xs = VG.take n (VG.drop i xs)

tryErrorPrint :: Show a => String -> a -> IO ()
tryErrorPrint prefix doSlice = do
  putStr prefix
  try (pure $! doSlice) >>= \case
    Left (ErrorCall err) -> putStrLn ('\n':err)
    Right result -> print result

printSlices :: (Show a, Show b) => String -> (Int -> Int -> b -> a) -> b -> IO ()
printSlices name sliceWith xs = do
  putStrLn $ replicate 50 '='
  putStrLn $ "slice (" ++ name ++ "): " ++ show xs
  putStrLn $ "   normal: " ++ show (sliceWith 1 3 xs)
  tryErrorPrint "   negative ix: " (sliceWith (-2) 2 xs)
  tryErrorPrint "   negative size: " (sliceWith 2 (-2) xs)
  tryErrorPrint "   negative ix and size: " (sliceWith (-2) (-1) xs)
  tryErrorPrint "   too large ix: " (sliceWith 6 2 xs)
  tryErrorPrint "   too large size: "  (sliceWith 2 6 xs)
  tryErrorPrint "   too large ix size: " (sliceWith 6 6 xs)

main :: IO ()
main = do
  let xs = [1, 2, 3, 4, 5] :: [Int]
  printSlices "List" sliceList xs
  printSlices "Vector proposed" sliceVectorProposed $ V.fromList xs
  printSlices "Vector.Boxed current - fused" (\i n -> V.slice i n . V.fromList) xs
  printSlices "Vector.Primitive current - fused" (\i n -> VP.slice i n . VP.fromList) xs
  printSlices "Vector current - unfused"  V.slice (V.fromList xs)




-- main = do
--   let xs = [1, 2, 3, 4, 5] :: [Int]
--       v = V.slice 1 (maxBound `div` 8) (V.fromList xs)
--   print $ V.length v


-- main = do
--   let xs = [1, 2, 3, 4, 5] :: [Int]
--       mySlice = V.slice 1 8
--   v <- do
--       mv <- MV.new 5
--       M.mapM_ (uncurry (MV.write mv)) $ List.zip [0..] xs
--       V.freeze mv
--   print $ mySlice $ V.fromList xs
--   print $ mySlice v

