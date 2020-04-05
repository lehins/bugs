{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ExistentialQuantification #-}
module Main where

import Control.Monad.ST

class Monad m => MonadRandom g m where
  data GenM g :: (* -> *) -> *

type family StateToken (m :: * -> *) :: *
type instance StateToken IO = RealWorld
type instance StateToken (ST s) = s

newtype MutGen g = MutGen g

data MutVar s g

instance (s ~ StateToken m, Monad m) => MonadRandom (MutGen g) m where
  data GenM (MutGen g) m = MutGenM (MutVar s g)
-- Correct version below compiles:
--  newtype GenM (MutGen g) m = MutGenM (MutVar (StateToken m) g)


main :: IO ()
main = pure ()
