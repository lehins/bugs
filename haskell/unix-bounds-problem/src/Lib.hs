-- |
-- Module      : Lib
-- Copyright   : (c) Alexey Kuleshevich 2023
-- License     : BSD3
-- Maintainer  : Alexey Kuleshevich <alexey@kuleshevi.ch>
-- Stability   : experimental
-- Portability : non-portable
--
module Lib
  ( someFunc
  ) where

import System.Posix.PosixPath.FilePath
import System.OsString.Internal.Types

someFunc :: IO ()
someFunc = putStrLn "someFunc"
