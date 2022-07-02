module Main where


import Data.Primitive.ByteArray
import Foreign.C.Types
import Data.Int

main :: IO ()
main = do
  mba1 <- unsafeThawByteArray $ byteArrayFromList [1..10 :: Int8]
  mba2 <- unsafeThawByteArray $ byteArrayFromList (replicate 10 (0 :: Int8))
  let nOverflowed = fromIntegral (maxBound :: Int32) * 2 + 5
  putStrLn $ "Trying to copy at offset: " ++ show nOverflowed
  moveByteArray mba2 1 mba1 nOverflowed 5
  print =<< unsafeFreezeByteArray mba1
  print =<< unsafeFreezeByteArray mba2
