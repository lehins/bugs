-- |
-- Module      : Lib
-- Copyright   : (c) Alexey Kuleshevich 2025
-- License     : BSD3
-- Maintainer  : Alexey Kuleshevich <alexey@kuleshevi.ch>
-- Stability   : experimental
-- Portability : non-portable
module Lib.Internal.Class (
  MyClass(..)
) where


class Show a => MyClass a where
  -- | My doctest:
  --
  -- >>> import Lib.Internal.Type
  -- >>> myFunc MyType
  -- "MyType"
  myFunc :: a -> String
  myFunc = show
