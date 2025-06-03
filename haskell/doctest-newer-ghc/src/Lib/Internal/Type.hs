-- |
-- Module      : Lib
-- Copyright   : (c) Alexey Kuleshevich 2025
-- License     : BSD3
-- Maintainer  : Alexey Kuleshevich <alexey@kuleshevi.ch>
-- Stability   : experimental
-- Portability : non-portable
module Lib.Internal.Type (
  MyType (..),
) where

import Lib.Internal.Class

data MyType = MyType deriving (Show)

instance MyClass MyType
