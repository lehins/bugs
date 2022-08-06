{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

module Main (main) where

import Data.Kind

newtype Decoder a = Decoder (String -> a)

class Monoid (Share a) => From a where
  type Share a :: Type

  decoderWithShare :: Share a -> Decoder a

decode :: From a => String -> a
decode str =
  case decoderWithShare mempty of
    Decoder f -> f str

class (Ord (Currency e), From (Tx e)) => Ledger e where
--class Ord (Currency e) => Ledger e where
  type Currency e :: Type
  type Tx e :: Type

data MyLedger c

newtype MyTx c = MyTx
  { currency :: c
  } deriving (Show, Read)

instance (Read c, Ord c) => Ledger (MyLedger c) where
  type Currency (MyLedger c) = c
  type Tx (MyLedger c) = MyTx c

instance (Read c, Ledger (MyLedger c)) => From (MyTx c) where
  type Share (MyTx c) = [c]
  decoderWithShare s =
    Decoder $ \str ->
      let c = read str
      in MyTx $ if elem c s then c else c


main :: IO ()
main = do
  print (decode (show (currency (MyTx "USD"))) :: MyTx String)
