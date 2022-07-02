--{-# LANGUAGE OverloadedLists #-}

import Control.Monad.Primitive

import Control.Monad
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as VM
import GHC.Magic
import Data.Primitive.PrimArray as A

blah n v = go 0
  where
    go i
      | i < n = putStrLn ("iter: " ++ show i) >> go (i + 1)
      | otherwise = V.unsafeThaw v
    {-# INLINE go #-}

gotcha :: IO ()
gotcha = do
  replicateM_ 5 $ do
    vm <- noinline V.unsafeThaw (V.generate 1 id)
    --vm <- blah 2 (V.generate 1 id)
    x <- VM.read vm 0
    print x
    VM.write vm 0 (100 + x)

gotcha' :: IO ()
gotcha' = do
  replicateM_ 5 $ do
    vm <- noinline A.unsafeThawPrimArray (inline A.generatePrimArray 1 id)
    --vm <- blah 2 (V.generate 1 id)
    x <- A.readPrimArray vm 0
    print x
    A.writePrimArray vm 0 (100 + x)


main :: IO ()
main = do
  gotcha
  -- foo 100000
  -- foo 100000

  -- let f = foo 100000 in f >> f

foo :: Int -> IO ()
foo n = do
  indexVector <- noinline V.unsafeThaw $ V.generate n id

  x <- VM.read indexVector 5
  VM.write indexVector 5 (x * x)

  print x


-- try3 :: IO ()
-- try3 = do
--   vm1 <- (noinline V.unsafeThaw) [(0 :: Int) .. 10]
--   vm2 <- (noinline V.unsafeThaw) [(0 :: Int) .. 10]
--   VM.write vm1 0 100
--   VM.write vm2 1 111
--   print =<< VM.read vm1 0
--   print =<< VM.read vm1 1
--   print =<< VM.read vm2 0
--   print =<< VM.read vm2 1

try1 :: IO ()
try1 = do
  vm1 <- V.unsafeThaw (V.generate 10 id)
  vm2 <- V.unsafeThaw (V.generate 10 id)
  VM.write vm1 0 100
  VM.write vm2 1 111
  print =<< VM.read vm1 0
  print =<< VM.read vm1 1
  print =<< VM.read vm2 0
  print =<< VM.read vm2 1


