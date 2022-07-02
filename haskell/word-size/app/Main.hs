module Main where
import qualified Data.Vector.Generic as VG
import qualified Data.Vector.Primitive as VP
import qualified Data.Vector.Fusion.Stream.Monadic as VFS
import qualified Data.Vector.Fusion.Bundle.Monadic as VFB
--import System.Random.Stateful

-- main :: IO ()
-- main = do
--   let res = runStateGen_ (mkStdGen 2020) uniformM :: Int
--   print res


main :: IO ()
main = do
  let -- consStream 0 acc = acc
      -- consStream n acc = consStream (n - 1) (n `VFS.cons` acc)
      k = 7
      consBundle 0 acc = acc
      consBundle n acc = consBundle (n - 1) (n `VFB.cons` acc)
      consVector' :: Int -> VP.Vector Int
      consVector' k' = VG.unstream (consBundle k' VFB.empty)
      consVector :: Int -> VP.Vector Int -> VP.Vector Int
      consVector 0 acc = acc
      consVector n acc = consVector (n - 1) (n `VP.cons` acc)
  putStrLn (consVector' k `seq` "consBundle")
  putStrLn (consVector k VP.empty `seq` "consVector")
