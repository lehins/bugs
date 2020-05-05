module Main
  ( main
  ) where

import MyInt8

main :: IO ()
main = do
  let y = foldl (+) (-125 :: Int8) [0 .. 5]
  print (y `seq` "Foo")
